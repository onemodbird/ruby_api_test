require "rails_helper"

describe NotificationSerializer do
  let(:notification) { create :notification }
  let(:collaboration) { create :collaboration }
  let(:comment) { create :comment }
  let(:collection) { create :collection }
  let(:resource) { create :resource }
  let(:chat_invitation) { create :chat_invitation}
  let(:serialized) { NotificationSerializer.serialize(notification) }
  let(:expected) {{
    id: notification.id,
    key: notification.key,
    params: notification.params,
    acknowledged: notification.acknowledged,
    created_at_i: time.to_i
  }}
  let(:time) { Time.now }
  before{ Timecop.freeze(time) }

  it "matches the expected output" do
    expect(serialized).to eq(expected)
  end

  it "includes collaboration if present" do
    notification.params[:collaboration_id] = collaboration.id
    expected[:collaboration] = CollaborationSerializer.serialize(collaboration)
    expect(serialized).to eq(expected)
  end

  it "includes comment if present" do
    notification.params[:comment_id] = comment.id
    expected[:comment] = CommentDetailedSerializer.serialize(comment)
    expect(serialized).to eq(expected)
  end

  it "includes collection if present" do
    notification.params[:collection_id] = collection.id
    expected[:collection] = CollectionSimpleSerializer.serialize(collection)
    expect(serialized).to eq(expected)
  end

  it "includes resource if present" do
    notification.params[:resource_id] = resource.id
    expected[:resource] = ResourceSimpleSerializer.serialize(resource)
    expect(serialized).to eq(expected)
  end

  it "includes collection resource if present" do
    collection = create(:collection, :with_resources, resources_count: 1)
    collection_resource = collection.collection_resources.first

    notification.params[:collection_resource_id] = collection_resource.id
    expected[:collection_resource] = CollectionResourceSimpleSerializer.serialize(collection_resource)
    expect(serialized).to eq(expected)
  end

  it "includes acceptor if present" do
    acceptor = create :user
    notification.params[:acceptor_id] = acceptor.id

    expected[:acceptor] = UserSimpleSerializer.serialize(acceptor)
    expect(serialized).to eq(expected)
  end

  it "skips items that are missing" do
    notification.params[:collaboration_id] = "garbage"
    notification.params[:resource_id] = "garbage"
    notification.params[:collection_id] = "garbage"
    notification.params[:comment_id] = "garbage"
    notification.params[:collaboration_id] = "garbage"

    expect(serialized).to eq(expected)
  end
end
