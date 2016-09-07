class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :commentable_id
      t.string :commentable_type
      t.text :content
      t.timestamps null: false
    end

    add_index :comments, :commentable_id
  end
end
