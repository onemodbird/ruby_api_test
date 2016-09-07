require "learning_registry/publish"

class LearningRegistryDeleteJob
  include Sidekiq::Worker

  def perform(learning_registry_id, resource_id)
    LearningRegistry::Publish.delete(learning_registry_id)

    resource = Resource.find_by(id: resource_id)
    resource.update(learning_registry_id: nil) if resource
  end
end
