class ChatSimpleSerializer < BaseSerializer
  attributes :id, :name, :description, :channel, :edcamp, :featured, :permissions, :analytics, :moderator_list, :archived_at

  def channel
    "public-m-chat-#{object.id}"
  end
end
