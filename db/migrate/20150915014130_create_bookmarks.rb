class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks, id: :uuid do |t|
      t.uuid :user_id, null: false
      t.string :url, null: false
      t.string :normalized_url, null: false
      t.string :title
      t.string :favicon_url

      t.timestamps null: false
    end

    add_index :bookmarks, :user_id
  end
end
