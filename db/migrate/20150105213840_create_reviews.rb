class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :resource_id
      t.integer :content_score, default: 0, null: false
      t.integer :feature_score, default: 0, null: false
      t.integer :engagement_score, default: 0, null: false
      t.integer :total_score, default: 0, null: false
      t.integer :percent_score, default: 0, null: false
      t.string :lede
      t.text :comment
      t.datetime :published_at

      t.timestamps null: false
    end
    add_index :reviews, :user_id
  end
end
