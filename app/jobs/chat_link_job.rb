class ChatLinkJob
  include Sidekiq::Worker

  LINKIS_URL_REGEX = %r{\Ahttps?://linkis\.com/}
  LINKIS_EXTRACTION_REGEX = %r{\s+href\s*=\s*"/url/redirect/(https?://[^"]+)"}

  def perform(url, tweet_id, realtime = true)
    @url = url
    @tweet_id = tweet_id
    @realtime = realtime

    return [] if @url =~ blacklisted_hostnames_regex
    fetch_resource_url
    return [] if http_response_indicates_job_should_abort_and_not_retry
    return [] if any_url_in_request_redirect_chain_is_blacklisted
    raise_if_http_response_is_unsuccessful
    return [] if linkis_url
    lookup_chat_messages
    find_or_create_resource
    queue_for_learning_registry
    create_chat_resources
    send_realtime_chat_resource_updates if @realtime

    @chat_resources
  end

  private

  def is_oer?
    chat_ids = @chat_messages.map{ |message| message.chat_id }
    Chat.where(id: chat_ids).pluck(:oer).any?
  end

  def queue_for_learning_registry
    LearningRegistrySubmission.create(resource_id: @resource.id) if is_oer?
  end

  def lookup_chat_messages
    @chat_messages = ChatMessage.where(tweet_id: @tweet_id)
    if @chat_messages.empty?
      raise ChatMessagesNotFound.new("tweet_id = #{@tweet_id}")
    end
  end

  def fetch_resource_url
    @response = EasyFetcher.get(@url)
  end

  def raise_if_http_response_is_unsuccessful
    unless @response.code == 200
      message = "code=#{@response.code}" <<
                " return_code=#{@response.return_code}" <<
                " tweet_id=#{@tweet_id}" <<
                " url=#{@url}"
      raise HttpError.new(message)
    end
  end

  def http_response_indicates_job_should_abort_and_not_retry
    [403, 404, 500].include?(@response.code) ||
      @response.return_code == :couldnt_resolve_host ||
      @response.timed_out?
  end

  def any_url_in_request_redirect_chain_is_blacklisted
    @response.redirect_urls.any?{ |url| url.match blacklisted_hostnames_regex }
  end

  def linkis_url
    return unless @response.effective_url =~ LINKIS_URL_REGEX

    non_linkis_url = @response.body[LINKIS_EXTRACTION_REGEX, 1]

    if non_linkis_url
      ChatLinkJob.perform_async(non_linkis_url, @tweet_id)
    end
    true
  end

  def find_or_create_resource
    @resource =
      Appo::ResourceFactory.new(
        @response.effective_url,
        prefetch: @response).resource_with_data_fetch

    @resource.visibility = "public"
    if @resource.new_record?
      @resource.flags["created_via_twitter"] = true
    end

    @resource.save!
  rescue ActiveRecord::RecordNotUnique
    retry
  end

  def create_chat_resources
    @chat_resources = @chat_messages.map do |chat_message|
      ChatResource.create!(
        chat_id: chat_message.chat_id,
        chat_message_id: chat_message.id,
        resource_id: @resource.id,
        redirect_count: @response.redirect_count
      )
    end
  end

  def send_realtime_chat_resource_updates
    @chat_resources.each do |chat_resource|
      RealtimeService.publish([chat_resource.chat],
        :chat_resource,
        false,
        ChatResourceSerializer.serialize(chat_resource),
        async: false)
    end
  end

  def blacklisted_hostnames_regex
    @blacklisted_hostnames_regex ||=
      begin
        hostnames = Regexp.union(BlacklistedChatHostname.all)
        %r{
          \A               # anchor to the beginning of the string
          https?://        # match protocol/scheme
          (?:[^/]+\.)*     # allow for subdomains
          (?:              # start a non-capturing group for alternation

          #{hostnames}     # interpolate partial hostnames from the database

          )                # end of the non-capturing alternation group
          (?:/|\z)         # ensure the end of hostname or end of string
        }xi
      end
  end

  class HttpError < StandardError ; end
  class ChatMessagesNotFound < StandardError ; end
end
