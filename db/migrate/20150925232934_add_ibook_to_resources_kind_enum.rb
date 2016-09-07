require 'postgres_enum_type_modifier'

class AddIbookToResourcesKindEnum < ActiveRecord::Migration
  include PostgresEnumTypeModifier

  def change
    reversible do |migrate|

      migrate.up do
        modify_enum(
          table: 'resources',
          field: 'kind',
          values: %w(undefined app video webpage video_channel file ibook),
          default_value: 'undefined')
      end

      migrate.down do
        modify_enum(
          table: 'resources',
          field: 'kind',
          values: %w(undefined app video webpage video_channel file),
          default_value: 'undefined')
      end

    end
  end
end
