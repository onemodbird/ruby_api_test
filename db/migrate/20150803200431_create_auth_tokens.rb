class CreateAuthTokens < ActiveRecord::Migration
  def up
    add_column :users, :auth_tokens, :jsonb, null: false, after: :auth_token, default: []
    add_index  :users, :auth_tokens, using: :gin

    User.find_each do |u|
      u.update_attribute :auth_tokens, [u[:auth_token]]
      p "Migrating auth tokens for #{u.email || u.name}"
    end
  end

  def down
    remove_column :users, :auth_tokens
  end
end
