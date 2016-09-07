class CreateBadgeTables < ActiveRecord::Migration
  def change
    create_table :badge_issuers, id: :uuid do |t|
      t.integer :viflearn_id
      t.string  :name
      t.string  :url
      t.string  :organization
      t.string  :email
      t.string  :salesforce_id
      t.timestamps
    end
    add_index :badge_issuers, :viflearn_id, unique: true
    add_index :badge_issuers, :salesforce_id


    create_table :badges, id: :uuid do |t|
      t.integer :viflearn_badgeid
      t.uuid    :issuer_id
      t.string  :salesforce_id
      t.string  :name
      t.string  :description
      t.string  :subheading
      t.string  :image_url
      t.string  :criteria_url
      t.string  :criteria_description
      t.integer :hours_equivalency
      t.string  :tags
      t.string  :designtitle
      t.string  :unit
      t.string  :program
      t.string  :grade_level
      t.string  :year
      t.string  :module
      t.string  :module_key
      t.string  :badge_type
      t.string  :subid
      t.timestamps
    end
    add_index :badges, :viflearn_badgeid, unique: true
    add_index :badges, :issuer_id
    add_index :badges, :salesforce_id, unique: true


    create_table :badge_assertions, id: :uuid do |t|
      t.integer  :viflearn_assertion_id
      t.uuid     :badge_id
      t.uuid     :user_id
      t.datetime :issued_at
      t.string   :evidence_url
      t.integer  :item_id
      t.string   :school_salesforce_id
      t.string   :district_salesforce_id
      t.string   :json_file
      t.boolean  :published
      t.string   :salesforce_id
      t.timestamps
    end
    add_index :badge_assertions, :viflearn_assertion_id, unique: true
    add_index :badge_assertions, [:user_id, :badge_id], unique: true
    add_index :badge_assertions, :salesforce_id, unique: true
  end
end
