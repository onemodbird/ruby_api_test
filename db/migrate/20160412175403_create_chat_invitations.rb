class CreateChatInvitations < ActiveRecord::Migration
  def change
    create_table :chat_invitations, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :chat_id
      t.citext :email
      t.string :token
      t.datetime :accepted_at
      t.uuid :acceptor_id

      t.timestamps
    end

    add_index :chat_invitations, [:email, :chat_id]
    add_index :chat_invitations, :user_id
    add_index :chat_invitations, :token
  end
end
