require "postgres_enum_type_modifier"

class AddProtectedVisibilityToCollection < ActiveRecord::Migration
  include PostgresEnumTypeModifier

  def change
    reversible do |migrate|
      migrate.up do
        modify_enum(
          table: "collections",
          field: "visibility",
          values: %w(public hidden private protected),
          default_value: "public")
      end

      migrate.down do
        modify_enum(
          table: "collections",
          field: "visibility",
          values: %w(public hidden private),
          default_value: "public")
      end
    end
  end
end
