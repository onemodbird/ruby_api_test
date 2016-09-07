class ChangeOrganizationsToSti < ActiveRecord::Migration
  def up
    ActiveRecord::Base.connection.execute(%(
      UPDATE organizations SET kind=initcap(lower(kind));
      ))

    rename_column :organizations, :kind, :type
    rename_column :organizations, :parent_id, :district_id

    add_column :organizations, :state_id, :uuid

    add_index :organizations, :type
    add_index :organizations, :state_id
    add_index :organizations, :district_id
  end

  def down
    ActiveRecord::Base.connection.execute(%(
      UPDATE organizations SET type=lower(type);
      ))
    remove_index :organizations, :type
    remove_index :organizations, :state_id
    remove_index :organizations, :district_id

    rename_column :organizations, :type, :kind
    rename_column :organizations, :district_id, :parent_id
    remove_column :organizations, :state_id
  end
end
