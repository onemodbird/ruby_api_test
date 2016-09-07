require "learning_registry/publish"

class LearningRegistryPublishJob
  include Sidekiq::Worker

  def perform(resource_id, publish_action)
    resource = Resource.find(resource_id)

    learning_registry_id =
      LearningRegistry::Publish.public_send(publish_action, resource)

    if publish_action == "create"
      resource.index! # required to prevent ES index from failing after update
    end

    # skip flag is so we don't get into an infinite loop
    resource.skip_publish_to_learning_registry_callback = true
    resource.update(
      learning_registry_id: learning_registry_id,
      visibility: "public")
  end
end
