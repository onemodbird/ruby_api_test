class CreateUploadedFiles < ActiveRecord::Migration
  def change
    reversible do |migrating|
      migrating.up do
        execute(%(
          CREATE TYPE uploaded_files_attached_class
          AS ENUM ('Collection')
        ))
      end

      migrating.down do
        execute(%(
          DROP TYPE uploaded_files_attached_class
        ))
      end
    end

    create_table :uploaded_files, id: :uuid do |t|
      t.uuid :user_id, null: false
      t.column :attached_class, 'uploaded_files_attached_class', null: false
      t.uuid :attached_id, null: false
      t.string :file, null: false
      t.string :url

      t.timestamps null: false
    end

  end
end
