class AddImportedDataToUploadedFiles < ActiveRecord::Migration
  def change
    add_column :uploaded_files, :imported_data, :jsonb, default: {}
  end
end
