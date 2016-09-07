class AddVisibilityToResources < ActiveRecord::Migration
  def change
    reversible do |migrating|
      migrating.up do
        execute(%(
          CREATE TYPE resources_visibility
          AS ENUM ('undefined', 'public', 'hidden', 'private')
        ))
      end

      migrating.down do
        execute(%(
          DROP TYPE resources_visibility
        ))
      end
    end

    add_column :resources, :visibility, 'resources_visibility',
               null: false, default: 'undefined'
  end
end
