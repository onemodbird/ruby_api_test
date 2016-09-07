require "postgres_enum_type_modifier"

class AddProtectedVisibilityToResources < ActiveRecord::Migration
  include PostgresEnumTypeModifier

  def change
    reversible do |migrate|
      migrate.up do
        modify_enum(
          table: "resources",
          field: "visibility",
          values: %w(undefined public hidden private protected),
          default_value: "undefined")
      end

      migrate.down do
        modify_enum(
          table: "resources",
          field: "visibility",
          values: %w(undefined public hidden private),
          default_value: "undefined")
      end
    end
  end
end
