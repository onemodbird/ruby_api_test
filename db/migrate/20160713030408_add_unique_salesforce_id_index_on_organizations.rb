class AddUniqueSalesforceIdIndexOnOrganizations < ActiveRecord::Migration
  def change
    add_index :organizations, [:salesforce_id, :kind], unique: true
  end
end
