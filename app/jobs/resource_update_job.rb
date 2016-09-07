class ResourceUpdateJob
  include Sidekiq::Worker

  FETCHERS = {
    app: Appo::Fetchers::App,
    video: Appo::Fetchers::Video,
    webpage: Appo::Fetchers::Webpage,
    ibook: Appo::Fetchers::Ibook
  }

  def perform(resource_id)
    resource = Resource.find(resource_id)
    update(resource)
  end

  def update(resource)
    if attributes = fetch(resource)
      resource.attributes = attributes
      resource.save! if resource.changed?
    else
      resource.update_attributes(defunct_at: Time.now)
    end
  end

  def fetch(resource)
    if clazz = FETCHERS[resource.kind.to_sym]
      fetcher = clazz.new(resource.url)
      fetcher.update_attributes
    else
      raise "Cannot update #{resource.kind}"
    end
  end

  def self.updatable_types
    FETCHERS.keys
  end
end
