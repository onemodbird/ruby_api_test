class AddExpertToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :expert, :boolean, default: false, null: false
  end
end
