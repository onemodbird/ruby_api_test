class CreateLibraryResources < ActiveRecord::Migration
  def change
    create_table :library_resources do |t|
      t.jsonb :json, null: false, default: {}
      t.timestamps null: false
    end
  end
end
