class MoveLedeToDescription < ActiveRecord::Migration
  def change
    reversible do |migrate|

      migrate.up do
        execute %[
          UPDATE resources
          SET description = lede
          WHERE lede <> ''
          AND (description = '' OR description IS NULL)
        ]
      end

      migrate.down do
        # nothing to do
      end

    end
  end
end
