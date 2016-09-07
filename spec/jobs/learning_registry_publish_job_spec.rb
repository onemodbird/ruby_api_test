require "rails_helper"

RSpec.describe LearningRegistryPublishJob, type: :job do
  let(:resource_id) { double }
  let(:resource) { double }
  let(:publish_action) { double }
  let(:learning_registry_id) { double }

  it "publishes and updates the resource" do
    allow(resource).to receive(:skip_publish_to_learning_registry_callback=)
    expect(Resource).to receive(:find).with(resource_id).and_return(resource)

    expect(LearningRegistry::Publish)
      .to receive(:public_send)
      .with(publish_action, resource)
      .and_return(learning_registry_id)

    expect(resource)
      .to receive(:update)
      .with(learning_registry_id: learning_registry_id, visibility: "public")

    LearningRegistryPublishJob.new.perform(resource_id, publish_action)
  end
end
