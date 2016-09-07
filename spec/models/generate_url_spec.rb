require "rails_helper"

RSpec.describe GenerateUrl do
  let(:name) { "A B.C--D:E/F\"G'H" }
  let(:name_param) { "a-b-c-d-e-f-g-h" }

  let(:article) { create :article, title: name }
  let(:collection) { create :collection, name: name }
  let(:webpage) { create :resource, :webpage, name: name }
  let(:video) { create :resource, :video, name: name }
  let(:file) { create :resource, :file, name: name }
  let(:ibook) { create :resource, :ibook, name: name }
  let(:ios_app) { create :resource, :ios_app, name: name }
  let(:android_app) { create :resource, :android_app, name: name }

  let(:article_url) { url("articles", article.id) }
  let(:collection_url) { url("collections", collection.id) }
  let(:webpage_url) { url("webpages", webpage.id) }
  let(:video_url) { url("videos", video.id) }
  let(:file_url) { url("files", file.id) }
  let(:ibook_url) { url("ibooks", ibook.id) }
  let(:ios_app_url) { url("ios-apps", ios_app.id) }
  let(:android_app_url) { url("android-apps", android_app.id) }

  def url(path_segment, id)
    "https://www.participate.com/#{path_segment}/#{name_param}/#{id}"
  end

  it "creates urls for articles" do
    expect(GenerateUrl.for(article)).to eq(article_url)
  end

  it "creates urls for collections" do
    expect(GenerateUrl.for(collection)).to eq(collection_url)
  end

  it "creates urls for webpage resources" do
    expect(GenerateUrl.for(webpage)).to eq(webpage_url)
  end

  it "creates urls for video resources" do
    expect(GenerateUrl.for(video)).to eq(video_url)
  end

  it "creates urls for file resources" do
    expect(GenerateUrl.for(file)).to eq(file_url)
  end

  it "creates urls for ibook resources" do
    expect(GenerateUrl.for(ibook)).to eq(ibook_url)
  end

  it "creates urls for ios_app resources" do
    expect(GenerateUrl.for(ios_app)).to eq(ios_app_url)
  end

  it "creates urls for android_app resources" do
    expect(GenerateUrl.for(android_app)).to eq(android_app_url)
  end

end
