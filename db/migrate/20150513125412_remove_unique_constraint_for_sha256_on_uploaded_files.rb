class RemoveUniqueConstraintForSha256OnUploadedFiles < ActiveRecord::Migration
  def change
    remove_index :uploaded_files, column: 'sha256', unique: true
    add_index :uploaded_files, :sha256, unique: false
  end
end
