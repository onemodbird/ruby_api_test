require 'postgres_enum_type_modifier'

class AddChannelToArticles < ActiveRecord::Migration
  include PostgresEnumTypeModifier

  def change
    reversible do |migrate|
      migrate.up do
        add_enum(
          table: "articles",
          field: "channel",
          values: %w(advisor blog),
          default_value: "advisor")

        add_index :articles, :channel
      end

      migrate.down do
        remove_enum(table: "articles", field: "channel")
      end
    end
  end
end
