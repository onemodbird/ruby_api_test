class AddRolesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :roles, :jsonb, default: []

    reversible do |migrating|
      migrating.up do
        execute <<-SQL
          UPDATE users
          SET roles = '["expert"]'
          WHERE id IN (
            SELECT user_id FROM reviews
          )
        SQL
      end
    end
  end
end
