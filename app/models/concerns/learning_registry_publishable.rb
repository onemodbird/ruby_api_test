module LearningRegistryPublishable
  extend ActiveSupport::Concern

  included do
    after_commit :publish_to_learning_registry,
      on: [:create, :update, :destroy]

    attr_accessor :skip_publish_to_learning_registry_callback
  end

  def publish_to_learning_registry
    action =
      if !persisted? || !oer?
        learning_registry_id.present? ? :delete : nil
      else
        learning_registry_id.present? ? :update : :create
      end

    if action.nil? || skip_publish_to_learning_registry_callback
      return
    elsif action == :delete
      LearningRegistryDeleteJob.perform_async(learning_registry_id, id)
    else
      LearningRegistryPublishJob.perform_async(id, action.to_s)
    end
  end
end
