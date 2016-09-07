class AddSha256ToUploadedFiles < ActiveRecord::Migration
  def change
    remove_column :uploaded_files, :attached_id
    remove_column :uploaded_files, :attached_class
    execute "DROP TYPE uploaded_files_attached_class"
    add_column :uploaded_files, :sha256, :string
    add_index :uploaded_files, :sha256, unique: true
  end
end
