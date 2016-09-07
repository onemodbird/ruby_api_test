module Event
  class ResourceAdded < Base
    def initialize(collection_resource)
      @collection_resource = collection_resource
    end

    def process!
      notify_subscribers
    end

    private

    def notify_subscribers
      subscribers.each do |user|
        user.notify(key,
          collection_resource_id: @collection_resource.id)
      end
    end

    def subscribers
      @collection_resource.collection.subscribers - [@collection_resource.user]
    end
  end
end
