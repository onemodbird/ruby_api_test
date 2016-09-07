class ChangePrivateToVisibility < ActiveRecord::Migration
  def change
    reversible do |migrating|
      migrating.up do
        execute(%(
          CREATE TYPE collections_visibility
          AS ENUM ('public', 'hidden', 'private')
        ))
      end

      migrating.down do
        execute(%(
          DROP TYPE collections_visibility
        ))
      end
    end

    add_column :collections, :visibility, 'collections_visibility',
               null: false, default: 'public'

    reversible do |migrating|
      migrating.up do
        execute(%(
          UPDATE collections
          SET visibility = 'private'
          WHERE private = true
        ))
      end

      migrating.down do
        execute(%(
          UPDATE collections
          SET private = true
          WHERE visibility = 'private' OR visibility = 'hidden'
        ))
      end
    end

    remove_column :collections, :private, :boolean, null: false, default: false
  end
end
