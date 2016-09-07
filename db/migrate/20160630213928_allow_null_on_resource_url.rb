class AllowNullOnResourceUrl < ActiveRecord::Migration
  def change
    change_column_null :resources, :url, true
  end
end
