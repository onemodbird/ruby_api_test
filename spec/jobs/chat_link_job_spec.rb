require "rails_helper"

RSpec.describe ChatLinkJob, type: :job do

  let(:job) { ChatLinkJob.new }
  let(:url) { Faker::Internet.url }
  let(:url2) { Faker::Internet.url }
  let(:tweet_id) { rand(100000000000000000..999999999999999999).to_s }
  let(:chat) { create :chat }
  let!(:chat_messages) { create_list :chat_message, 2, tweet_id: tweet_id, chat: chat }

  let(:blacklisted_urls) {%w(
    http://b1d387mjw4nk-m58w733x6c9m3.hop.clickbank.net/hop/?
    https://ssl.clickbank.net/order/restricted.html
    http://clickbank.net
  )}

  def easy_fetcher(hash={})
    instance_double("EasyFetcher", {
      code: 200,
      return_code: :ok,
      body: "",
      effective_url: url,
      timed_out?: false,
      redirect_count: 1,
      redirect_urls: []
    }.merge(hash))
  end

  def set_http_response(hash)
    expect(EasyFetcher)
      .to receive(:get)
      .with(url)
      .and_return(easy_fetcher(hash))
  end

  before(:each) do
    allow(EasyFetcher).to receive(:get).with(url).and_return(easy_fetcher)
  end

  it "aborts the job if http status is 403" do
    set_http_response(code: 403)
    expect(job.perform(url, tweet_id)).to eq([])
  end

  it "aborts the job if http status is 404" do
    set_http_response(code: 404)
    expect(job.perform(url, tweet_id)).to eq([])
  end

  it "aborts the job if http status is 500" do
    set_http_response(code: 500)
    expect(job.perform(url, tweet_id)).to eq([])
  end

  it "aborts the job if host cannot be resolved" do
    set_http_response(code: 301, return_code: :couldnt_resolve_host)
    expect(job.perform(url, tweet_id)).to eq([])
  end

  it "aborts the job if the request times out" do
    set_http_response(
      code: 200,
      return_code: :operation_timedout,
      timed_out?: true
    )
    expect(job.perform(url, tweet_id)).to eq([])
  end

  describe "blacklisting" do
    it "aborts the job if the initial url is blacklisted" do
      blacklisted_urls.each do |blacklisted_url|
        expect(EasyFetcher).not_to receive(:get)
        expect(job.perform(blacklisted_url, tweet_id)).to eq([])
      end
    end

    it "aborts the job if a redirect url is blacklisted" do
      blacklisted_urls.each do |blacklisted_url|
        set_http_response(code: 200, redirect_urls: [blacklisted_url])
        expect(job.perform(url, tweet_id)).to eq([])
      end
    end
  end

  it "raises if chat_messages are not found" do
    ChatMessage.delete_all
    expect { job.perform(url, tweet_id) }
      .to raise_error(ChatLinkJob::ChatMessagesNotFound)
  end

  it "raises if the http response is not 200 and not aborted" do
    set_http_response(code: 999)
    expect { job.perform(url, tweet_id) }
      .to raise_error(ChatLinkJob::HttpError)
  end

  it "creates chat_resources" do
    expect { job.perform(url, tweet_id) }
      .to change(ChatResource, :count).from(0).to(2)
  end

  it "returns an array of chat_resources" do
    chat_resources = job.perform(url, tweet_id)
    expect(chat_resources.size).to eq(2)
  end

  it "finds existing resources if they exist" do
    resource = create :resource, url: url
    chat_resources = job.perform(url, tweet_id)
    resource.reload
    expect(chat_resources[0].resource_id).to eq(resource.id)
    expect(resource.flags["created_via_twitter"]).to eq(nil)
    expect(resource.visibility).to eq("public")
  end

  it "retries find when resource url is not unique", :no_transaction do
    resource = create :resource, url: url
    new_resource = Resource.new(resource.attributes.slice(*%w(url kind name)))
    resource_factory = double(:resource_factory)

    allow(Appo::ResourceFactory)
      .to receive(:new).and_return(resource_factory)

    expect(resource_factory)
    .to receive(:resource_with_data_fetch).and_return(new_resource)

    expect(resource_factory)
    .to receive(:resource_with_data_fetch).and_return(resource)

    chat_resources = job.perform(resource.url, tweet_id)
    expect(chat_resources[0].resource_id).to eq(resource.id)
  end

  it "creates resources" do
    chat_resources = job.perform(url, tweet_id)
    resource = Resource.first
    expect(chat_resources[0].resource_id).to eq(resource.id)
    expect(resource.flags["created_via_twitter"]).to eq(true)
    expect(resource.visibility).to eq("public")
  end

  it "counts the number of redirects" do
    set_http_response(redirect_count: 2)
    chat_resources = job.perform(url, tweet_id)
    expect(chat_resources[0].redirect_count).to eq(2)
  end

  it "resolves linkis urls" do
    linkis_url = "http://linkis.com/www.edutopia.org/blo/egiBc"
    new_url = "http://new.url"

    allow(EasyFetcher)
      .to receive(:get)
      .with(linkis_url)
      .and_return(easy_fetcher(
        effective_url: linkis_url,
        body: <<-HTML
          <html>
            <body>
              <a  href=   "/url/redirect/#{new_url}" />
            </body>
          </html>
        HTML
      ))

    expect(ChatLinkJob).to receive(:perform_async).with(new_url, tweet_id)
    expect(job.perform(linkis_url, tweet_id)).to eq([])
  end

  it "sends a realtime update" do
    allow(RealtimeService).to receive(:publish)

    chat_resources = job.perform(url, tweet_id)

    chat_resources.each do |chat_resource|
      expect(RealtimeService)
        .to have_received(:publish)
        .with(
          [chat_resource.chat],
          :chat_resource,
          false,
          ChatResourceSerializer.serialize(chat_resource),
          async: false)
      end
  end

  it "does not send a realtime update" do
    expect(RealtimeService).to_not receive(:publish)
    chat_resources = job.perform(url, tweet_id, false)
  end

  context "with an OER chat" do
    before do
      allow_any_instance_of(Resource).to receive(
        :skip_publish_to_learning_registry_callback).and_return(true)
    end

    let(:chat) { create :chat, oer: true }

    it "queues a learning registry submission" do
      expect { job.perform(url, tweet_id) }
        .to change(LearningRegistrySubmission, :count).from(0).to(1)

      expect(Resource.first.oer).to be false
    end
  end

end
