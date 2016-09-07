class AddMessageToCollaboration < ActiveRecord::Migration
  def change
    add_column :collaborations, :message, :text
  end
end
