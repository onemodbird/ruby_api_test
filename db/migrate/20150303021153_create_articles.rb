class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles, id: :uuid do |t|
      t.integer :blog_post_id
      t.uuid :user_id, null: false
      t.string :title
      t.text :body
      t.datetime :published_at
      t.text :excerpt
      t.boolean :featured, default: false, null: false
      t.boolean :ipad_app_featured, default: false, null: false
      t.integer :ipad_app_position
      t.jsonb :categories
      t.jsonb :app_ids

      t.timestamps null: false
    end
  end
end
