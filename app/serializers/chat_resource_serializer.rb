class ChatResourceSerializer < BaseSerializer
  attributes :id, :chat_id, :chat_message_id
  attributes :resource

  def resource
    ResourceSimpleSerializer.serialize(object.resource)
  end
end
