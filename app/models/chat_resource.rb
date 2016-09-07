class ChatResource < ActiveRecord::Base
  belongs_to :chat
  belongs_to :chat_message
  belongs_to :resource

  validates :chat_id, :chat_message_id, :resource_id, presence: true
end
