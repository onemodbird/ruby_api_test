# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "a_2016_roster_imports", primary_key: "temp_id", force: :cascade do |t|
    t.string   "name",                 limit: 50
    t.string   "username",             limit: 50
    t.string   "email",                limit: 50
    t.string   "password",             limit: 255, default: "$2y$10$aSw4i.O8o18zG0RDkmSxp.GbG8yjTlKfMx1dJI1sgiidryI.UPt/m"
    t.integer  "block",                limit: 4,   default: 0
    t.integer  "sendEmail",            limit: 4,   default: 0
    t.datetime "registerDate",                     default: '2016-03-01 01:00:00'
    t.datetime "lastvisitDate",                    default: '2001-01-01 01:00:00'
    t.integer  "activation",           limit: 4,   default: 0
    t.string   "params",               limit: 50,  default: "{}"
    t.datetime "lastResetTime"
    t.integer  "resetCount",           limit: 4,   default: 0
    t.integer  "requireReset",         limit: 4,   default: 0
    t.string   "otpKey",               limit: 50
    t.string   "otep",                 limit: 50
    t.string   "contactrecordtype",    limit: 50
    t.string   "salesforceID",         limit: 50
    t.string   "accountID",            limit: 50
    t.string   "schoolID",             limit: 50
    t.string   "districtID",           limit: 50
    t.string   "lc_user_status",       limit: 45
    t.string   "title",                limit: 255
    t.string   "grade",                limit: 255
    t.string   "subject",              limit: 255
    t.string   "subscription_group_1", limit: 255
    t.integer  "new_joomla_userid",    limit: 4
  end

  create_table "a_remove_year1", primary_key: "auto_id", force: :cascade do |t|
    t.integer "lc_user_id",     limit: 4
    t.integer "year2_groupid",  limit: 4
    t.string  "con_user_group", limit: 45
  end

  create_table "badge_audit", id: false, force: :cascade do |t|
    t.integer  "EarnedBadgeID",         limit: 4,   null: false
    t.string   "EmailAddress",          limit: 255
    t.integer  "JoomlaEarnedBadgeID",   limit: 4
    t.integer  "EarnedBadgeRecipient",  limit: 4
    t.datetime "EarnedBadgeIssuedDate"
    t.string   "EarnedBadgeEvidence",   limit: 87
    t.string   "BadgeType",             limit: 50
    t.integer  "ItemID",                limit: 4
    t.string   "BadgeName",             limit: 100
    t.string   "GradeLevel",            limit: 11
    t.string   "Year",                  limit: 100
    t.string   "Module",                limit: 100
    t.integer  "BadgeIssuer",           limit: 4
  end

  create_table "historical_subscription_data", id: false, force: :cascade do |t|
    t.integer  "SubscriptionMappingID",      limit: 4
    t.integer  "PlanID",                     limit: 4
    t.string   "EmailAddress",               limit: 69
    t.string   "SubscriptionName",           limit: 66
    t.integer  "LCUserID",                   limit: 4
    t.integer  "SubscriptionStatus",         limit: 4
    t.string   "SubscriptionStartDate",      limit: 50
    t.datetime "SubscriptionExpirationDate"
    t.datetime "LCLastModifiedDate"
    t.string   "distinct_matching",          limit: 50
  end

  create_table "import_roster1", primary_key: "temp_id", force: :cascade do |t|
    t.text    "firstname",         limit: 65535
    t.text    "lastname",          limit: 65535
    t.text    "name",              limit: 65535
    t.text    "title",             limit: 65535
    t.text    "grade",             limit: 65535
    t.text    "subject",           limit: 65535
    t.text    "email",             limit: 65535
    t.text    "username",          limit: 65535
    t.text    "lc_user_status",    limit: 65535
    t.text    "districtID",        limit: 65535
    t.text    "schoolID",          limit: 65535
    t.text    "accountID",         limit: 65535
    t.text    "contactrecordtype", limit: 65535
    t.text    "subscription_plan", limit: 65535
    t.integer "usergroup",         limit: 4
    t.integer "planid",            limit: 4
    t.integer "lc_userid",         limit: 4
    t.text    "concat",            limit: 65535
  end

  create_table "jitterbit_sync_updates", force: :cascade do |t|
    t.string   "operation_name",           limit: 45
    t.datetime "last_successful_datetime"
  end

  create_table "lc_lti_consumer", primary_key: "consumer_key", force: :cascade do |t|
    t.string   "name",             limit: 45,  null: false
    t.string   "secret",           limit: 32,  null: false
    t.string   "lti_version",      limit: 12
    t.string   "consumer_name",    limit: 255
    t.string   "consumer_version", limit: 255
    t.string   "consumer_guid",    limit: 255
    t.string   "css_path",         limit: 255
    t.boolean  "protected",                    null: false
    t.boolean  "enabled",                      null: false
    t.datetime "enable_from"
    t.datetime "enable_until"
    t.date     "last_access"
    t.datetime "created",                      null: false
    t.datetime "updated",                      null: false
  end

  create_table "lc_lti_context", id: false, force: :cascade do |t|
    t.string   "consumer_key",         limit: 255,   null: false
    t.string   "context_id",           limit: 255,   null: false
    t.string   "lti_context_id",       limit: 255
    t.string   "lti_resource_id",      limit: 255
    t.string   "title",                limit: 255,   null: false
    t.text     "settings",             limit: 65535
    t.string   "primary_consumer_key", limit: 255
    t.string   "primary_context_id",   limit: 255
    t.boolean  "share_approved"
    t.datetime "created",                            null: false
    t.datetime "updated",                            null: false
  end

  create_table "lc_lti_nonce", id: false, force: :cascade do |t|
    t.string   "consumer_key", limit: 255, null: false
    t.string   "value",        limit: 32,  null: false
    t.datetime "expires",                  null: false
  end

  create_table "lc_lti_share_key", primary_key: "share_key_id", force: :cascade do |t|
    t.string   "primary_consumer_key", limit: 255, null: false
    t.string   "primary_context_id",   limit: 255, null: false
    t.boolean  "auto_approve",                     null: false
    t.datetime "expires",                          null: false
  end

  create_table "lc_lti_user", id: false, force: :cascade do |t|
    t.string   "consumer_key",         limit: 255, null: false
    t.string   "context_id",           limit: 255, null: false
    t.string   "user_id",              limit: 255, null: false
    t.string   "lti_result_sourcedid", limit: 255, null: false
    t.datetime "created",                          null: false
    t.datetime "updated",                          null: false
  end

  create_table "lc_user_status", id: false, force: :cascade do |t|
    t.integer "user_id",        limit: 4
    t.text    "username",       limit: 65535
    t.text    "lc_user_status", limit: 65535
  end

  create_table "lead_audit", id: false, force: :cascade do |t|
    t.integer  "LC_User_Id__c",           limit: 4,   null: false
    t.string   "FirstName",               limit: 255, null: false
    t.string   "LastName",                limit: 255, null: false
    t.string   "LC_Username__c",          limit: 150, null: false
    t.string   "Email",                   limit: 100, null: false
    t.string   "EmailAddress",            limit: 100, null: false
    t.datetime "LC_Member_Start_Date__c",             null: false
    t.datetime "LC_Last_Visited_Date__c",             null: false
  end

  create_table "pd_cat_alias", id: false, force: :cascade do |t|
    t.integer "id",        limit: 4
    t.text    "cat_name",  limit: 65535
    t.text    "alias",     limit: 65535
    t.text    "old_alias", limit: 65535
  end

  create_table "restore_enterprise2", id: false, force: :cascade do |t|
    t.integer "plan_id",                    limit: 4
    t.integer "user_id",                    limit: 4
    t.integer "group_id",                   limit: 4
    t.string  "concatenate_userid_groupid", limit: 45
  end

  create_table "subscription_audit", id: false, force: :cascade do |t|
    t.integer  "SubscriptionMappingID",      limit: 4
    t.integer  "PlanID",                     limit: 4
    t.string   "EmailAddress",               limit: 255
    t.string   "SubscriptionName",           limit: 255
    t.integer  "LCUserID",                   limit: 4
    t.string   "SubscriptionStatus",         limit: 11
    t.datetime "SubscriptionStartDate"
    t.datetime "SubscriptionExpirationDate"
    t.datetime "LCLastModifiedDate"
  end

  create_table "subscription_audit_archive", id: false, force: :cascade do |t|
    t.integer  "SubscriptionMappingID",      limit: 4,   null: false
    t.integer  "PlanID",                     limit: 4,   null: false
    t.string   "EmailAddress",               limit: 255, null: false
    t.string   "SubscriptionName",           limit: 255, null: false
    t.integer  "LCUserID",                   limit: 4,   null: false
    t.string   "SubscriptionStatus",         limit: 11,  null: false
    t.datetime "SubscriptionStartDate",                  null: false
    t.datetime "SubscriptionExpirationDate",             null: false
    t.datetime "LCLastModifiedDate",                     null: false
  end

  create_table "subscription_audit_new", id: false, force: :cascade do |t|
    t.integer  "SubscriptionMappingID",      limit: 4,   null: false
    t.integer  "PlanID",                     limit: 4,   null: false
    t.string   "EmailAddress",               limit: 255, null: false
    t.string   "SubscriptionName",           limit: 255, null: false
    t.integer  "LCUserID",                   limit: 4,   null: false
    t.string   "SubscriptionStatus",         limit: 11,  null: false
    t.datetime "SubscriptionStartDate",                  null: false
    t.datetime "SubscriptionExpirationDate",             null: false
    t.datetime "LCLastModifiedDate",                     null: false
    t.string   "distinct_matching",          limit: 45
  end

  create_table "wlje4_admintools_acl", primary_key: "user_id", force: :cascade do |t|
    t.text "permissions", limit: 16777215
  end

  create_table "wlje4_admintools_adminiplist", id: false, force: :cascade do |t|
    t.integer "id",          limit: 8,   null: false
    t.string  "ip",          limit: 255
    t.string  "description", limit: 255
  end

  add_index "wlje4_admintools_adminiplist", ["id"], name: "id", unique: true, using: :btree

  create_table "wlje4_admintools_badwords", id: false, force: :cascade do |t|
    t.integer "id",   limit: 8,   null: false
    t.string  "word", limit: 255
  end

  add_index "wlje4_admintools_badwords", ["id"], name: "id", unique: true, using: :btree

  create_table "wlje4_admintools_cookies", primary_key: "series", force: :cascade do |t|
    t.string   "client_hash", limit: 255, null: false
    t.datetime "valid_to",                null: false
  end

  create_table "wlje4_admintools_customperms", id: false, force: :cascade do |t|
    t.integer "id",    limit: 8,                    null: false
    t.string  "path",  limit: 255,                  null: false
    t.string  "perms", limit: 4,   default: "0644"
  end

  add_index "wlje4_admintools_customperms", ["id"], name: "id", unique: true, using: :btree
  add_index "wlje4_admintools_customperms", ["path"], name: "path", using: :btree

  create_table "wlje4_admintools_filescache", primary_key: "admintools_filescache_id", force: :cascade do |t|
    t.string  "path",     limit: 2048,               null: false
    t.integer "filedate", limit: 4,     default: 0,  null: false
    t.integer "filesize", limit: 4,     default: 0,  null: false
    t.binary  "data",     limit: 65535
    t.string  "checksum", limit: 32,    default: "", null: false
  end

  create_table "wlje4_admintools_ipautoban", id: false, force: :cascade do |t|
    t.string   "ip",     limit: 255,                   null: false
    t.string   "reason", limit: 255, default: "other"
    t.datetime "until"
  end

  add_index "wlje4_admintools_ipautoban", ["ip"], name: "ip", unique: true, using: :btree

  create_table "wlje4_admintools_ipautobanhistory", force: :cascade do |t|
    t.string   "ip",     limit: 255,                   null: false
    t.string   "reason", limit: 255, default: "other"
    t.datetime "until"
  end

  create_table "wlje4_admintools_ipblock", id: false, force: :cascade do |t|
    t.integer "id",          limit: 8,   null: false
    t.string  "ip",          limit: 255
    t.string  "description", limit: 255
  end

  add_index "wlje4_admintools_ipblock", ["id"], name: "id", unique: true, using: :btree

  create_table "wlje4_admintools_log", id: false, force: :cascade do |t|
    t.integer  "id",        limit: 8,        null: false
    t.datetime "logdate",                    null: false
    t.string   "ip",        limit: 40
    t.string   "url",       limit: 255
    t.string   "reason",    limit: 12
    t.text     "extradata", limit: 16777215
  end

  add_index "wlje4_admintools_log", ["id"], name: "id", unique: true, using: :btree
  add_index "wlje4_admintools_log", ["logdate", "reason"], name: "idx_admintools_log_logdate_reason", using: :btree

  create_table "wlje4_admintools_profiles", force: :cascade do |t|
    t.string "description",   limit: 255,        null: false
    t.text   "configuration", limit: 4294967295
    t.text   "filters",       limit: 4294967295
  end

  create_table "wlje4_admintools_redirects", id: false, force: :cascade do |t|
    t.integer "id",            limit: 8,                  null: false
    t.string  "source",        limit: 255
    t.string  "dest",          limit: 255
    t.integer "ordering",      limit: 8,   default: 0,    null: false
    t.boolean "published",                 default: true, null: false
    t.boolean "keepurlparams",             default: true, null: false
  end

  add_index "wlje4_admintools_redirects", ["id"], name: "id", unique: true, using: :btree

  create_table "wlje4_admintools_scanalerts", primary_key: "admintools_scanalert_id", force: :cascade do |t|
    t.string  "path",         limit: 2048,                 null: false
    t.integer "scan_id",      limit: 8,        default: 0, null: false
    t.text    "diff",         limit: 16777215
    t.integer "threat_score", limit: 4,        default: 0, null: false
    t.integer "acknowledged", limit: 1,        default: 0, null: false
  end

  create_table "wlje4_admintools_scans", force: :cascade do |t|
    t.string   "description",     limit: 255,                            null: false
    t.text     "comment",         limit: 4294967295
    t.datetime "backupstart",                                            null: false
    t.datetime "backupend",                                              null: false
    t.string   "status",          limit: 8,          default: "run",     null: false
    t.string   "origin",          limit: 30,         default: "backend", null: false
    t.string   "type",            limit: 30,         default: "full",    null: false
    t.integer  "profile_id",      limit: 8,          default: 1,         null: false
    t.text     "archivename",     limit: 4294967295
    t.text     "absolute_path",   limit: 4294967295
    t.integer  "multipart",       limit: 4,          default: 0,         null: false
    t.string   "tag",             limit: 255
    t.string   "backupid",        limit: 255
    t.integer  "filesexist",      limit: 1,          default: 1,         null: false
    t.string   "remote_filename", limit: 1000
    t.integer  "total_size",      limit: 8,          default: 0,         null: false
  end

  add_index "wlje4_admintools_scans", ["filesexist", "status"], name: "idx_fullstatus", using: :btree
  add_index "wlje4_admintools_scans", ["status", "origin"], name: "idx_stale", using: :btree

  create_table "wlje4_admintools_storage", primary_key: "key", force: :cascade do |t|
    t.text "value", limit: 4294967295, null: false
  end

  create_table "wlje4_admintools_wafblacklists", force: :cascade do |t|
    t.string "option",        limit: 255, null: false
    t.string "view",          limit: 255, null: false
    t.string "task",          limit: 255, null: false
    t.string "query",         limit: 255, null: false
    t.string "query_type",    limit: 1,   null: false
    t.string "query_content", limit: 255, null: false
    t.string "verb",          limit: 6,   null: false
  end

  create_table "wlje4_admintools_wafexceptions", force: :cascade do |t|
    t.string "option", limit: 255
    t.string "view",   limit: 255
    t.string "query",  limit: 255
  end

  create_table "wlje4_admintools_waftemplates", primary_key: "admintools_waftemplate_id", force: :cascade do |t|
    t.string   "reason",        limit: 255,                 null: false
    t.string   "language",      limit: 10,    default: "*", null: false
    t.string   "subject",       limit: 255,                 null: false
    t.text     "template",      limit: 65535,               null: false
    t.integer  "enabled",       limit: 1,     default: 1,   null: false
    t.integer  "email_num",     limit: 1,                   null: false
    t.integer  "email_numfreq", limit: 1,                   null: false
    t.string   "email_freq",    limit: 6,     default: "",  null: false
    t.datetime "created_on",                                null: false
    t.integer  "created_by",    limit: 8,     default: 0,   null: false
    t.datetime "modified_on",                               null: false
    t.integer  "modified_by",   limit: 8,     default: 0,   null: false
  end

  add_index "wlje4_admintools_waftemplates", ["reason", "language"], name: "admintools_waftemplate_keylang", unique: true, using: :btree

  create_table "wlje4_admissions_document_checklist_applicant_items", force: :cascade do |t|
    t.integer "applicant_userid",   limit: 4
    t.string  "checklist_itemid",   limit: 255
    t.string  "filename",           limit: 255
<<<<<<< HEAD
    t.string  "thumbnail",          limit: 255, default: "https://www.greenprintmedia.org/images/main/icons/offline_doc.png"
    t.string  "filetitle",          limit: 255, default: "{title is blank}"
    t.string  "link",               limit: 255, default: "https://www.greenprintmedia.org/index.php/offline-file-confirmation"
=======
    t.string  "thumbnail",          limit: 255, default: "https://www.greenprintmedia.org/images/main/icons/offline_doc.png"
    t.string  "filetitle",          limit: 255, default: "{title is blank}"
    t.string  "link",               limit: 255, default: "https://www.greenprintmedia.org/index.php/offline-file-confirmation"
>>>>>>> parent of 0bd3464... customize to greenprintmedia
    t.string  "requirement_type",   limit: 255
    t.string  "submissions_status", limit: 255, default: "Submitted online"
    t.string  "acceptance_status",  limit: 255, default: "Not Reviewed"
    t.string  "salesforce_id",      limit: 50
  end

  add_index "wlje4_admissions_document_checklist_applicant_items", ["salesforce_id"], name: "uniqueSFid", unique: true, using: :btree

  create_table "wlje4_admissions_document_checklist_comments", force: :cascade do |t|
    t.integer  "applicant_id", limit: 4
    t.string   "itemid",       limit: 255
    t.string   "comment",      limit: 255
    t.integer  "reviewer_id",  limit: 4
    t.datetime "date_added"
    t.string   "salesforceID", limit: 255
  end

  add_index "wlje4_admissions_document_checklist_comments", ["salesforceID"], name: "salesforceID_UNIQUE", unique: true, using: :btree

  create_table "wlje4_akeeba_common", primary_key: "key", force: :cascade do |t|
    t.text "value", limit: 4294967295, null: false
  end

  create_table "wlje4_all_districts_directory", primary_key: "district_id", force: :cascade do |t|
    t.string "district_name",           limit: 255
    t.string "physical_city",           limit: 255
    t.string "mailing_city",            limit: 255
    t.string "physical_state_province", limit: 255
    t.string "mailing_state_province",  limit: 255
    t.binary "passport _cohort",        limit: 1
    t.binary "passport_single_team",    limit: 1
    t.binary "passport_whole_school",   limit: 1
    t.binary "splash_mandarin",         limit: 1
    t.binary "splash_spanish",          limit: 1
    t.binary "cet",                     limit: 1
  end

  create_table "wlje4_all_school_district_map", primary_key: "school_id", force: :cascade do |t|
    t.string "school_name",   limit: 255
    t.string "district_id",   limit: 255
    t.string "district_name", limit: 255
  end

  create_table "wlje4_all_schools_directory", primary_key: "school_id", force: :cascade do |t|
    t.string "school_name",           limit: 255
    t.string "city",                  limit: 255
    t.string "state",                 limit: 255
    t.binary "passport_cohort",       limit: 1
    t.binary "passport_single_team",  limit: 1
    t.binary "passport_whole_school", limit: 1
    t.binary "splash_mandarin",       limit: 1
    t.binary "splash_spanish",        limit: 1
    t.binary "cet",                   limit: 1
  end

  create_table "wlje4_assets", force: :cascade do |t|
    t.integer "parent_id", limit: 4,    default: 0, null: false
    t.integer "lft",       limit: 4,    default: 0, null: false
    t.integer "rgt",       limit: 4,    default: 0, null: false
    t.integer "level",     limit: 4,                null: false
    t.string  "name",      limit: 50,               null: false
    t.string  "title",     limit: 100,              null: false
    t.string  "rules",     limit: 5120,             null: false
  end

  add_index "wlje4_assets", ["lft", "rgt"], name: "idx_lft_rgt", using: :btree
  add_index "wlje4_assets", ["name"], name: "idx_asset_name", unique: true, using: :btree
  add_index "wlje4_assets", ["parent_id"], name: "idx_parent_id", using: :btree

  create_table "wlje4_associations", id: false, force: :cascade do |t|
    t.integer "id",      limit: 4,  null: false
    t.string  "context", limit: 50, null: false
    t.string  "key",     limit: 32, null: false
  end

  add_index "wlje4_associations", ["key"], name: "idx_key", using: :btree

  create_table "wlje4_badge_assertions", primary_key: "assertion_id", force: :cascade do |t|
    t.integer  "badge_id",                   limit: 4
    t.integer  "recipient",                  limit: 4
    t.string   "badge_url",                  limit: 81
    t.string   "verify",                     limit: 50
    t.datetime "issuedOn"
    t.string   "image",                      limit: 104
    t.string   "evidence",                   limit: 87
    t.integer  "expires",                    limit: 4
    t.string   "badge_type",                 limit: 50
    t.integer  "item_id",                    limit: 4
    t.string   "schoolID",                   limit: 45
    t.string   "districtID",                 limit: 45
    t.string   "json_file",                  limit: 255
    t.integer  "published",                  limit: 1
    t.string   "sf_ext_id",                  limit: 255
    t.string   "concatenate_badgeid_userid", limit: 45
  end

  add_index "wlje4_badge_assertions", ["assertion_id"], name: "assertion_id_index", using: :btree
  add_index "wlje4_badge_assertions", ["badge_id", "recipient"], name: "onebadgeperuserpercatid", unique: true, using: :btree
  add_index "wlje4_badge_assertions", ["sf_ext_id"], name: "sf_ext_id", using: :btree

  create_table "wlje4_badge_class", force: :cascade do |t|
    t.integer "badgeid",              limit: 4
    t.string  "name",                 limit: 113
    t.string  "description",          limit: 518
    t.string  "subheading",           limit: 87
    t.string  "image",                limit: 109
    t.string  "criteria",             limit: 97
    t.string  "criteria_description", limit: 830
    t.integer "hours_equivalency",    limit: 4
    t.string  "issuer",               limit: 50
    t.string  "alignment",            limit: 50
    t.string  "tags",                 limit: 92
    t.string  "designtitle",          limit: 52
    t.string  "unit",                 limit: 93
    t.string  "ext_id",               limit: 50
    t.string  "program",              limit: 58
    t.string  "grade_level",          limit: 50
    t.string  "year",                 limit: 50
    t.string  "module",               limit: 50
    t.string  "module_key",           limit: 51
    t.string  "badge_type",           limit: 50
    t.string  "subid",                limit: 50
    t.string  "state",                limit: 50
    t.string  "ordering",             limit: 50
    t.string  "created_by",           limit: 50
    t.string  "checked_out",          limit: 50
    t.string  "checked_out_time",     limit: 50
  end

  create_table "wlje4_badge_class_archive", force: :cascade do |t|
    t.integer  "badgeid",              limit: 4,   null: false
    t.string   "name",                 limit: 100
    t.string   "description",          limit: 800
    t.string   "subheading",           limit: 255
    t.string   "image",                limit: 200
    t.string   "criteria",             limit: 200
    t.string   "criteria_description", limit: 800
    t.integer  "issuer",               limit: 4
    t.string   "alignment",            limit: 200
    t.string   "tags",                 limit: 200
    t.string   "designtitle",          limit: 255
    t.string   "unit",                 limit: 200
    t.string   "ext_id",               limit: 255
    t.string   "program",              limit: 400
    t.string   "grade_level",          limit: 11
    t.string   "year",                 limit: 100
    t.string   "module",               limit: 100
    t.string   "module_key",           limit: 45
    t.string   "badge_type",           limit: 45
    t.integer  "subid",                limit: 4
    t.boolean  "state"
    t.integer  "ordering",             limit: 4
    t.integer  "created_by",           limit: 4
    t.integer  "checked_out",          limit: 4
    t.datetime "checked_out_time"
  end

  create_table "wlje4_badge_issuer", force: :cascade do |t|
    t.string "issuer_name",         limit: 100
    t.string "issuer_url",          limit: 200
    t.string "issuer_organization", limit: 100
    t.string "issuer_contact",      limit: 100
    t.string "sf_issuer_id",        limit: 45
  end

  create_table "wlje4_badge_k2item_match", force: :cascade do |t|
    t.integer "userid",   limit: 4
    t.string  "k2itemid", limit: 255
  end

  create_table "wlje4_banner_clients", force: :cascade do |t|
    t.string   "name",              limit: 255,   default: "", null: false
    t.string   "contact",           limit: 255,   default: "", null: false
    t.string   "email",             limit: 255,   default: "", null: false
    t.text     "extrainfo",         limit: 65535,              null: false
    t.integer  "state",             limit: 1,     default: 0,  null: false
    t.integer  "checked_out",       limit: 4,     default: 0,  null: false
    t.datetime "checked_out_time",                             null: false
    t.text     "metakey",           limit: 65535,              null: false
    t.integer  "own_prefix",        limit: 1,     default: 0,  null: false
    t.string   "metakey_prefix",    limit: 255,   default: "", null: false
    t.integer  "purchase_type",     limit: 1,     default: -1, null: false
    t.integer  "track_clicks",      limit: 1,     default: -1, null: false
    t.integer  "track_impressions", limit: 1,     default: -1, null: false
  end

  add_index "wlje4_banner_clients", ["metakey_prefix"], name: "idx_metakey_prefix", using: :btree
  add_index "wlje4_banner_clients", ["own_prefix"], name: "idx_own_prefix", using: :btree

  create_table "wlje4_banner_tracks", id: false, force: :cascade do |t|
    t.datetime "track_date",                       null: false
    t.integer  "track_type", limit: 4,             null: false
    t.integer  "banner_id",  limit: 4,             null: false
    t.integer  "count",      limit: 4, default: 0, null: false
  end

  add_index "wlje4_banner_tracks", ["banner_id"], name: "idx_banner_id", using: :btree
  add_index "wlje4_banner_tracks", ["track_date"], name: "idx_track_date", using: :btree
  add_index "wlje4_banner_tracks", ["track_type"], name: "idx_track_type", using: :btree

  create_table "wlje4_banners", force: :cascade do |t|
    t.integer  "cid",               limit: 4,     default: 0,     null: false
    t.integer  "type",              limit: 4,     default: 0,     null: false
    t.string   "name",              limit: 255,   default: "",    null: false
    t.string   "alias",             limit: 255,   default: "",    null: false
    t.integer  "imptotal",          limit: 4,     default: 0,     null: false
    t.integer  "impmade",           limit: 4,     default: 0,     null: false
    t.integer  "clicks",            limit: 4,     default: 0,     null: false
    t.string   "clickurl",          limit: 200,   default: "",    null: false
    t.integer  "state",             limit: 1,     default: 0,     null: false
    t.integer  "catid",             limit: 4,     default: 0,     null: false
    t.text     "description",       limit: 65535,                 null: false
    t.string   "custombannercode",  limit: 2048,                  null: false
    t.boolean  "sticky",                          default: false, null: false
    t.integer  "ordering",          limit: 4,     default: 0,     null: false
    t.text     "metakey",           limit: 65535,                 null: false
    t.text     "params",            limit: 65535,                 null: false
    t.boolean  "own_prefix",                      default: false, null: false
    t.string   "metakey_prefix",    limit: 255,   default: "",    null: false
    t.integer  "purchase_type",     limit: 1,     default: -1,    null: false
    t.integer  "track_clicks",      limit: 1,     default: -1,    null: false
    t.integer  "track_impressions", limit: 1,     default: -1,    null: false
    t.integer  "checked_out",       limit: 4,     default: 0,     null: false
    t.datetime "checked_out_time",                                null: false
    t.datetime "publish_up",                                      null: false
    t.datetime "publish_down",                                    null: false
    t.datetime "reset",                                           null: false
    t.datetime "created",                                         null: false
    t.string   "language",          limit: 7,     default: "",    null: false
    t.integer  "created_by",        limit: 4,     default: 0,     null: false
    t.string   "created_by_alias",  limit: 255,   default: "",    null: false
    t.datetime "modified",                                        null: false
    t.integer  "modified_by",       limit: 4,     default: 0,     null: false
    t.integer  "version",           limit: 4,     default: 1,     null: false
  end

  add_index "wlje4_banners", ["catid"], name: "idx_banner_catid", using: :btree
  add_index "wlje4_banners", ["language"], name: "idx_language", using: :btree
  add_index "wlje4_banners", ["metakey_prefix"], name: "idx_metakey_prefix", using: :btree
  add_index "wlje4_banners", ["own_prefix"], name: "idx_own_prefix", using: :btree
  add_index "wlje4_banners", ["state"], name: "idx_state", using: :btree

  create_table "wlje4_blooie", force: :cascade do |t|
    t.boolean "active",             null: false
    t.string  "token",  limit: 128
  end

  create_table "wlje4_breezingforms", id: false, force: :cascade do |t|
    t.integer "id",       limit: 4,   null: false
    t.string  "language", limit: 255, null: false
  end

  create_table "wlje4_breezingforms_addons_gdata", force: :cascade do |t|
    t.integer "form_id",        limit: 4,     default: 0,     null: false
    t.string  "username",       limit: 255,   default: "",    null: false
    t.string  "password",       limit: 255,   default: "",    null: false
    t.boolean "enabled",                      default: false, null: false
    t.string  "spreadsheet_id", limit: 255,   default: "",    null: false
    t.string  "worksheet_id",   limit: 255,   default: "",    null: false
    t.text    "fields",         limit: 65535,                 null: false
    t.string  "meta",           limit: 255,                   null: false
    t.boolean "debug",                        default: false, null: false
  end

  add_index "wlje4_breezingforms_addons_gdata", ["form_id", "spreadsheet_id", "worksheet_id"], name: "form_id", using: :btree
  add_index "wlje4_breezingforms_addons_gdata", ["form_id"], name: "form_id_2", unique: true, using: :btree

  create_table "wlje4_categories", force: :cascade do |t|
    t.integer  "asset_id",         limit: 4,        default: 0,     null: false
    t.integer  "parent_id",        limit: 4,        default: 0,     null: false
    t.integer  "lft",              limit: 4,        default: 0,     null: false
    t.integer  "rgt",              limit: 4,        default: 0,     null: false
    t.integer  "level",            limit: 4,        default: 0,     null: false
    t.string   "path",             limit: 255,      default: "",    null: false
    t.string   "extension",        limit: 50,       default: "",    null: false
    t.string   "title",            limit: 255,                      null: false
    t.string   "alias",            limit: 255,      default: "",    null: false
    t.string   "note",             limit: 255,      default: "",    null: false
    t.text     "description",      limit: 16777215,                 null: false
    t.boolean  "published",                         default: false, null: false
    t.integer  "checked_out",      limit: 4,        default: 0,     null: false
    t.datetime "checked_out_time"
    t.integer  "access",           limit: 4,        default: 0,     null: false
    t.text     "params",           limit: 65535,                    null: false
    t.string   "metadesc",         limit: 1024,                     null: false
    t.string   "metakey",          limit: 1024,                     null: false
    t.string   "metadata",         limit: 2048,                     null: false
    t.integer  "created_user_id",  limit: 4,        default: 0,     null: false
    t.datetime "created_time"
    t.integer  "modified_user_id", limit: 4,        default: 0,     null: false
    t.datetime "modified_time"
    t.integer  "hits",             limit: 4,        default: 0,     null: false
    t.string   "language",         limit: 7,                        null: false
    t.integer  "version",          limit: 4,        default: 1,     null: false
  end

  add_index "wlje4_categories", ["access"], name: "idx_access", using: :btree
  add_index "wlje4_categories", ["alias"], name: "idx_alias", using: :btree
  add_index "wlje4_categories", ["checked_out"], name: "idx_checkout", using: :btree
  add_index "wlje4_categories", ["extension", "published", "access"], name: "cat_idx", using: :btree
  add_index "wlje4_categories", ["language"], name: "idx_language", using: :btree
  add_index "wlje4_categories", ["lft", "rgt"], name: "idx_left_right", using: :btree
  add_index "wlje4_categories", ["path"], name: "idx_path", using: :btree

  create_table "wlje4_cck_core", force: :cascade do |t|
    t.string   "cck",              limit: 50,  null: false
    t.integer  "pk",               limit: 4,   null: false
    t.integer  "pkb",              limit: 4,   null: false
    t.string   "storage_location", limit: 50,  null: false
    t.string   "storage_table",    limit: 100, null: false
    t.integer  "author_id",        limit: 4,   null: false
    t.integer  "parent_id",        limit: 4,   null: false
    t.integer  "store_id",         limit: 4,   null: false
    t.datetime "date_time",                    null: false
    t.string   "app",              limit: 255, null: false
  end

  add_index "wlje4_cck_core", ["cck"], name: "idx_cck", using: :btree
  add_index "wlje4_cck_core", ["pk"], name: "idx_pk", using: :btree

  create_table "wlje4_cck_core_activities", force: :cascade do |t|
    t.string  "title",       limit: 50,    null: false
    t.string  "name",        limit: 50,    null: false
    t.integer "folder",      limit: 4,     null: false
    t.string  "type",        limit: 50,    null: false
    t.text    "description", limit: 65535, null: false
    t.integer "published",   limit: 1,     null: false
  end

  add_index "wlje4_cck_core_activities", ["folder"], name: "idx_category", using: :btree
  add_index "wlje4_cck_core_activities", ["name"], name: "name", unique: true, using: :btree

  create_table "wlje4_cck_core_downloads", id: false, force: :cascade do |t|
    t.integer "id",         limit: 4,  null: false
    t.string  "field",      limit: 50, null: false
    t.string  "collection", limit: 50, null: false
    t.integer "x",          limit: 4,  null: false
    t.integer "hits",       limit: 4,  null: false
  end

  add_index "wlje4_cck_core_downloads", ["field"], name: "idx_item", using: :btree
  add_index "wlje4_cck_core_downloads", ["id"], name: "idx_contentid", using: :btree

  create_table "wlje4_cck_core_fields", force: :cascade do |t|
    t.string   "title",            limit: 50,                  null: false
    t.string   "name",             limit: 50,                  null: false
    t.integer  "folder",           limit: 4,                   null: false
    t.string   "type",             limit: 50,                  null: false
    t.string   "description",      limit: 5120,                null: false
    t.integer  "published",        limit: 1,                   null: false
    t.string   "label",            limit: 50,                  null: false
    t.string   "selectlabel",      limit: 50,                  null: false
    t.integer  "display",          limit: 4,     default: 0,   null: false
    t.string   "required",         limit: 50,                  null: false
    t.string   "validation",       limit: 50,                  null: false
    t.string   "defaultvalue",     limit: 2048,                null: false
    t.text     "options",          limit: 65535,               null: false
    t.text     "options2",         limit: 65535,               null: false
    t.integer  "minlength",        limit: 4,     default: 0,   null: false
    t.integer  "maxlength",        limit: 4,     default: 255, null: false
    t.integer  "size",             limit: 4,     default: 32,  null: false
    t.integer  "cols",             limit: 4,                   null: false
    t.integer  "rows",             limit: 4,                   null: false
    t.integer  "ordering",         limit: 4,     default: 0,   null: false
    t.integer  "sorting",          limit: 4,     default: 0,   null: false
    t.string   "divider",          limit: 50,                  null: false
    t.integer  "bool",             limit: 1,                   null: false
    t.string   "location",         limit: 1024,                null: false
    t.string   "extended",         limit: 50,                  null: false
    t.string   "style",            limit: 512,                 null: false
    t.text     "script",           limit: 65535,               null: false
    t.integer  "bool2",            limit: 1,     default: 0,   null: false
    t.integer  "bool3",            limit: 1,     default: 0,   null: false
    t.integer  "bool4",            limit: 1,     default: 0,   null: false
    t.integer  "bool5",            limit: 1,     default: 0,   null: false
    t.integer  "bool6",            limit: 1,     default: 0,   null: false
    t.integer  "bool7",            limit: 1,     default: 0,   null: false
    t.integer  "bool8",            limit: 1,     default: 1,   null: false
    t.string   "css",              limit: 255,                 null: false
    t.string   "attributes",       limit: 512,                 null: false
    t.string   "storage",          limit: 50,                  null: false
    t.string   "storage_cck",      limit: 50,                  null: false
    t.string   "storage_location", limit: 50,                  null: false
    t.string   "storage_table",    limit: 100,                 null: false
    t.string   "storage_field",    limit: 50,                  null: false
    t.string   "storage_field2",   limit: 50,                  null: false
    t.string   "storage_params",   limit: 2048,                null: false
    t.string   "storages",         limit: 2048,                null: false
    t.integer  "checked_out",      limit: 4,     default: 0,   null: false
    t.datetime "checked_out_time",                             null: false
  end

  add_index "wlje4_cck_core_fields", ["folder"], name: "idx_folder", using: :btree
  add_index "wlje4_cck_core_fields", ["name"], name: "name", unique: true, using: :btree
  add_index "wlje4_cck_core_fields", ["type"], name: "idx_type", using: :btree

  create_table "wlje4_cck_core_folders", force: :cascade do |t|
    t.integer  "asset_id",         limit: 4,    default: 0, null: false
    t.integer  "parent_id",        limit: 4,    default: 0, null: false
    t.string   "path",             limit: 1024,             null: false
    t.string   "title",            limit: 50,               null: false
    t.string   "name",             limit: 50,               null: false
    t.string   "color",            limit: 50,               null: false
    t.string   "introchar",        limit: 2,                null: false
    t.string   "colorchar",        limit: 50,               null: false
    t.string   "elements",         limit: 255,              null: false
    t.string   "icon_path",        limit: 100,              null: false
    t.integer  "depth",            limit: 4,    default: 0, null: false
    t.integer  "lft",              limit: 4,                null: false
    t.integer  "rgt",              limit: 4,                null: false
    t.string   "description",      limit: 5120,             null: false
    t.string   "app",              limit: 50,               null: false
    t.integer  "featured",         limit: 1,    default: 0, null: false
    t.integer  "home",             limit: 1,    default: 0, null: false
    t.integer  "published",        limit: 1,                null: false
    t.integer  "checked_out",      limit: 4,    default: 0, null: false
    t.datetime "checked_out_time",                          null: false
  end

  add_index "wlje4_cck_core_folders", ["parent_id"], name: "idx_parent_id", using: :btree

  create_table "wlje4_cck_core_objects", force: :cascade do |t|
    t.string "title",     limit: 50,    null: false
    t.string "name",      limit: 50,    null: false
    t.string "component", limit: 50,    null: false
    t.string "context",   limit: 50,    null: false
    t.text   "options",   limit: 65535, null: false
    t.string "vars",      limit: 255,   null: false
    t.string "view",      limit: 50,    null: false
  end

  add_index "wlje4_cck_core_objects", ["component"], name: "idx_component", using: :btree
  add_index "wlje4_cck_core_objects", ["name"], name: "name", unique: true, using: :btree
  add_index "wlje4_cck_core_objects", ["view"], name: "idx_view", using: :btree

  create_table "wlje4_cck_core_preferences", primary_key: "userid", force: :cascade do |t|
    t.text "options", limit: 65535, null: false
  end

  create_table "wlje4_cck_core_search_field", id: false, force: :cascade do |t|
    t.integer "searchid",            limit: 4,                 null: false
    t.integer "fieldid",             limit: 4,                 null: false
    t.string  "client",              limit: 50,                null: false
    t.integer "ordering",            limit: 4,                 null: false
    t.string  "label",               limit: 255,               null: false
    t.string  "variation",           limit: 50,                null: false
    t.string  "variation_override",  limit: 1024,              null: false
    t.string  "required",            limit: 50,                null: false
    t.string  "required_alert",      limit: 1024,              null: false
    t.string  "validation",          limit: 50,                null: false
    t.string  "validation_options",  limit: 1024,              null: false
    t.string  "link",                limit: 50,                null: false
    t.string  "link_options",        limit: 1024,              null: false
    t.string  "live",                limit: 50,                null: false
    t.string  "live_options",        limit: 1024,              null: false
    t.string  "live_value",          limit: 255,               null: false
    t.string  "markup",              limit: 50,                null: false
    t.string  "markup_class",        limit: 255,               null: false
    t.string  "match_collection",    limit: 50,                null: false
    t.string  "match_mode",          limit: 50,                null: false
    t.string  "match_options",       limit: 512,               null: false
    t.string  "match_value",         limit: 50,                null: false
    t.string  "typo",                limit: 50,                null: false
    t.integer "typo_label",          limit: 1,                 null: false
    t.string  "typo_options",        limit: 2048,              null: false
    t.integer "stage",               limit: 4,     default: 0, null: false
    t.integer "access",              limit: 4,     default: 0, null: false
    t.string  "restriction",         limit: 512,               null: false
    t.text    "restriction_options", limit: 65535,             null: false
    t.string  "computation",         limit: 512,               null: false
    t.string  "computation_options", limit: 1024,              null: false
    t.string  "conditional",         limit: 2048,              null: false
    t.text    "conditional_options", limit: 65535,             null: false
    t.string  "position",            limit: 50,                null: false
  end

  add_index "wlje4_cck_core_search_field", ["fieldid"], name: "fieldid", using: :btree
  add_index "wlje4_cck_core_search_field", ["searchid"], name: "searchid", using: :btree

  create_table "wlje4_cck_core_search_position", id: false, force: :cascade do |t|
    t.integer "searchid",          limit: 4,     null: false
    t.string  "position",          limit: 50,    null: false
    t.string  "client",            limit: 50,    null: false
    t.string  "legend",            limit: 255,   null: false
    t.string  "variation",         limit: 50,    null: false
    t.text    "variation_options", limit: 65535, null: false
    t.string  "width",             limit: 50,    null: false
    t.string  "height",            limit: 50,    null: false
    t.string  "css",               limit: 255,   null: false
  end

  add_index "wlje4_cck_core_search_position", ["position"], name: "position", using: :btree
  add_index "wlje4_cck_core_search_position", ["searchid"], name: "searchid", using: :btree

  create_table "wlje4_cck_core_searchs", force: :cascade do |t|
    t.string   "title",            limit: 50,                null: false
    t.string   "name",             limit: 50,                null: false
    t.string   "alias",            limit: 50,                null: false
    t.integer  "folder",           limit: 4,                 null: false
    t.integer  "content",          limit: 4,     default: 0, null: false
    t.integer  "template_search",  limit: 4,                 null: false
    t.integer  "template_filter",  limit: 4,                 null: false
    t.integer  "template_list",    limit: 4,                 null: false
    t.integer  "template_item",    limit: 4,                 null: false
    t.string   "description",      limit: 5120,              null: false
    t.integer  "access",           limit: 4,     default: 1, null: false
    t.integer  "published",        limit: 1,                 null: false
    t.text     "options",          limit: 65535,             null: false
    t.string   "location",         limit: 50,                null: false
    t.string   "sef_route",        limit: 50,                null: false
    t.string   "storage_location", limit: 50,                null: false
    t.string   "stylesheets",      limit: 5,                 null: false
    t.integer  "version",          limit: 4,     default: 1, null: false
    t.integer  "checked_out",      limit: 4,     default: 0, null: false
    t.datetime "checked_out_time",                           null: false
  end

  add_index "wlje4_cck_core_searchs", ["folder"], name: "idx_folder", using: :btree
  add_index "wlje4_cck_core_searchs", ["name"], name: "name", unique: true, using: :btree
  add_index "wlje4_cck_core_searchs", ["template_filter"], name: "idx_template_filter", using: :btree
  add_index "wlje4_cck_core_searchs", ["template_item"], name: "idx_template_item", using: :btree
  add_index "wlje4_cck_core_searchs", ["template_list"], name: "idx_template_list", using: :btree
  add_index "wlje4_cck_core_searchs", ["template_search"], name: "idx_template_search", using: :btree

  create_table "wlje4_cck_core_sites", force: :cascade do |t|
    t.string   "title",                limit: 50,               null: false
    t.string   "name",                 limit: 100,              null: false
    t.string   "aliases",              limit: 512,              null: false
    t.integer  "guest",                limit: 4,                null: false
    t.integer  "guest_only_group",     limit: 4,                null: false
    t.integer  "guest_only_viewlevel", limit: 4,                null: false
    t.string   "groups",               limit: 255,              null: false
    t.string   "viewlevels",           limit: 255,              null: false
    t.string   "configuration",        limit: 1024,             null: false
    t.string   "options",              limit: 2048,             null: false
    t.string   "description",          limit: 5120,             null: false
    t.integer  "published",            limit: 1,                null: false
    t.integer  "checked_out",          limit: 4,    default: 0, null: false
    t.datetime "checked_out_time",                              null: false
  end

  add_index "wlje4_cck_core_sites", ["name"], name: "name", unique: true, using: :btree

  create_table "wlje4_cck_core_templates", force: :cascade do |t|
    t.string   "title",            limit: 50,               null: false
    t.string   "name",             limit: 50,               null: false
    t.integer  "folder",           limit: 4,                null: false
    t.integer  "mode",             limit: 1,                null: false
    t.string   "description",      limit: 5120,             null: false
    t.integer  "featured",         limit: 1,    default: 0, null: false
    t.integer  "published",        limit: 1,                null: false
    t.integer  "checked_out",      limit: 4,    default: 0, null: false
    t.datetime "checked_out_time",                          null: false
  end

  add_index "wlje4_cck_core_templates", ["folder"], name: "idx_folder", using: :btree
  add_index "wlje4_cck_core_templates", ["name"], name: "name", unique: true, using: :btree

  create_table "wlje4_cck_core_type_field", id: false, force: :cascade do |t|
    t.integer "typeid",              limit: 4,                 null: false
    t.integer "fieldid",             limit: 4,                 null: false
    t.string  "client",              limit: 50,                null: false
    t.integer "ordering",            limit: 4,                 null: false
    t.string  "label",               limit: 255,               null: false
    t.string  "variation",           limit: 50,                null: false
    t.string  "variation_override",  limit: 1024,              null: false
    t.string  "required",            limit: 50,                null: false
    t.string  "required_alert",      limit: 1024,              null: false
    t.string  "validation",          limit: 50,                null: false
    t.string  "validation_options",  limit: 1024,              null: false
    t.string  "link",                limit: 50,                null: false
    t.string  "link_options",        limit: 1024,              null: false
    t.string  "live",                limit: 50,                null: false
    t.string  "live_options",        limit: 1024,              null: false
    t.string  "live_value",          limit: 255,               null: false
    t.string  "markup",              limit: 50,                null: false
    t.string  "markup_class",        limit: 255,               null: false
    t.string  "typo",                limit: 50,                null: false
    t.integer "typo_label",          limit: 1,                 null: false
    t.string  "typo_options",        limit: 2048,              null: false
    t.integer "stage",               limit: 4,     default: 0, null: false
    t.integer "access",              limit: 4,     default: 0, null: false
    t.string  "restriction",         limit: 512,               null: false
    t.text    "restriction_options", limit: 65535,             null: false
    t.string  "computation",         limit: 512,               null: false
    t.string  "computation_options", limit: 1024,              null: false
    t.string  "conditional",         limit: 2048,              null: false
    t.text    "conditional_options", limit: 65535,             null: false
    t.string  "position",            limit: 50,                null: false
  end

  add_index "wlje4_cck_core_type_field", ["fieldid"], name: "fieldid", using: :btree
  add_index "wlje4_cck_core_type_field", ["typeid"], name: "typeid", using: :btree

  create_table "wlje4_cck_core_type_position", id: false, force: :cascade do |t|
    t.integer "typeid",            limit: 4,     null: false
    t.string  "position",          limit: 50,    null: false
    t.string  "client",            limit: 50,    null: false
    t.string  "legend",            limit: 255,   null: false
    t.string  "variation",         limit: 50,    null: false
    t.text    "variation_options", limit: 65535, null: false
    t.string  "width",             limit: 50,    null: false
    t.string  "height",            limit: 50,    null: false
    t.string  "css",               limit: 255,   null: false
  end

  add_index "wlje4_cck_core_type_position", ["position"], name: "position", using: :btree
  add_index "wlje4_cck_core_type_position", ["typeid"], name: "typeid", using: :btree

  create_table "wlje4_cck_core_types", force: :cascade do |t|
    t.integer  "asset_id",         limit: 4,     default: 0, null: false
    t.string   "title",            limit: 50,                null: false
    t.string   "name",             limit: 50,                null: false
    t.string   "alias",            limit: 50,                null: false
    t.integer  "folder",           limit: 4,                 null: false
    t.integer  "template_admin",   limit: 4,     default: 0, null: false
    t.integer  "template_site",    limit: 4,     default: 0, null: false
    t.integer  "template_content", limit: 4,     default: 0, null: false
    t.integer  "template_intro",   limit: 4,     default: 0, null: false
    t.string   "description",      limit: 5120,              null: false
    t.string   "indexed",          limit: 50,                null: false
    t.integer  "published",        limit: 1,                 null: false
    t.text     "options_admin",    limit: 65535,             null: false
    t.text     "options_site",     limit: 65535,             null: false
    t.text     "options_content",  limit: 65535,             null: false
    t.text     "options_intro",    limit: 65535,             null: false
    t.string   "location",         limit: 50,                null: false
    t.string   "parent",           limit: 50,                null: false
    t.string   "storage_location", limit: 50,                null: false
    t.string   "stylesheets",      limit: 5,                 null: false
    t.integer  "version",          limit: 4,     default: 1, null: false
    t.integer  "checked_out",      limit: 4,     default: 0, null: false
    t.datetime "checked_out_time",                           null: false
    t.integer  "access",           limit: 4,     default: 3, null: false
    t.datetime "created_date",                               null: false
    t.integer  "created_user_id",  limit: 4,     default: 0, null: false
    t.datetime "modified_date",                              null: false
    t.integer  "modified_user_id", limit: 4,     default: 0, null: false
  end

  add_index "wlje4_cck_core_types", ["folder"], name: "idx_folder", using: :btree
  add_index "wlje4_cck_core_types", ["name"], name: "name", unique: true, using: :btree
  add_index "wlje4_cck_core_types", ["template_admin"], name: "idx_template_admin", using: :btree
  add_index "wlje4_cck_core_types", ["template_content"], name: "idx_template_content", using: :btree
  add_index "wlje4_cck_core_types", ["template_intro"], name: "idx_template_intro", using: :btree
  add_index "wlje4_cck_core_types", ["template_site"], name: "idx_template_site", using: :btree

  create_table "wlje4_cck_core_versions", force: :cascade do |t|
    t.integer  "e_id",             limit: 4,          default: 0, null: false
    t.string   "e_title",          limit: 50,                     null: false
    t.string   "e_name",           limit: 50,                     null: false
    t.string   "e_type",           limit: 50,                     null: false
    t.integer  "e_version",        limit: 4,          default: 1, null: false
    t.binary   "e_core",           limit: 4294967295
    t.string   "e_more",           limit: 255,                    null: false
    t.binary   "e_more1",          limit: 4294967295
    t.binary   "e_more2",          limit: 4294967295
    t.binary   "e_more3",          limit: 4294967295
    t.binary   "e_more4",          limit: 4294967295
    t.binary   "e_more5",          limit: 4294967295
    t.datetime "date_time",                                       null: false
    t.integer  "user_id",          limit: 4,          default: 0, null: false
    t.string   "note",             limit: 255,                    null: false
    t.integer  "checked_out",      limit: 4,          default: 0, null: false
    t.datetime "checked_out_time",                                null: false
  end

  add_index "wlje4_cck_core_versions", ["e_id", "e_type", "e_version"], name: "type_id_version", unique: true, using: :btree

  create_table "wlje4_cck_more_countries", force: :cascade do |t|
    t.string "name_en", limit: 255, null: false
    t.string "name_fr", limit: 255, null: false
    t.string "code2",   limit: 5,   null: false
    t.string "code3",   limit: 5,   null: false
  end

  create_table "wlje4_cck_more_processings", force: :cascade do |t|
    t.string   "title",            limit: 50,                null: false
    t.string   "name",             limit: 50,                null: false
    t.integer  "folder",           limit: 4,     default: 1, null: false
    t.string   "type",             limit: 50,                null: false
    t.string   "description",      limit: 5120,              null: false
    t.text     "options",          limit: 65535,             null: false
    t.integer  "ordering",         limit: 4,     default: 0, null: false
    t.integer  "published",        limit: 1,     default: 0, null: false
    t.text     "scriptfile",       limit: 65535,             null: false
    t.integer  "checked_out",      limit: 4,     default: 0, null: false
    t.datetime "checked_out_time",                           null: false
  end

  create_table "wlje4_cck_more_sessions", force: :cascade do |t|
    t.string  "title",     limit: 50,    null: false
    t.string  "extension", limit: 50,    null: false
    t.integer "folder",    limit: 4,     null: false
    t.string  "type",      limit: 50,    null: false
    t.text    "options",   limit: 65535, null: false
  end

  add_index "wlje4_cck_more_sessions", ["extension"], name: "idx_extension", using: :btree

  create_table "wlje4_cck_store_form_article", force: :cascade do |t|
    t.string "ggk5y1m1",    limit: 255, default: "", null: false
    t.string "attachments", limit: 255, default: "", null: false
  end

  create_table "wlje4_cck_store_form_badge_metadata_form", force: :cascade do |t|
    t.integer "article_title", limit: 4, null: false
  end

  create_table "wlje4_cck_store_form_k2_item_display", force: :cascade do |t|
    t.string "load_all_k2_items", limit: 255, null: false
  end

  create_table "wlje4_cck_store_form_my_lesson_plans3", force: :cascade do |t|
    t.string "title_header",      limit: 255, null: false
    t.string "title_header_text", limit: 255, null: false
    t.string "ggk5y1m1_name",     limit: 255, null: false
    t.string "edit_lesson_plan",  limit: 255, null: false
  end

  create_table "wlje4_cck_store_form_resource_library_main_page", force: :cascade do |t|
    t.string "resource_library_main_page", limit: 255, null: false
  end

  create_table "wlje4_cck_store_item_cck_store_form_k2_item_display", force: :cascade do |t|
    t.string "cck",                    limit: 50,  null: false
    t.string "unpublish_from_library", limit: 255, null: false
  end

  create_table "wlje4_cck_store_item_content", force: :cascade do |t|
    t.string "cck",                                    limit: 50,  null: false
    t.string "wlje4_badge_class | name",               limit: 255, null: false
    t.string "resource_library_search_results_narrow", limit: 255, null: false
    t.string "resource_library_search_results_wide",   limit: 255, null: false
    t.string "rebuild_test",                           limit: 255, null: false
    t.string "rebuild_test_prj",                       limit: 255, null: false
  end

  create_table "wlje4_cck_store_item_k2_items", force: :cascade do |t|
    t.string "cck",                    limit: 50,  null: false
    t.string "unpublish_from_library", limit: 255, null: false
  end

  create_table "wlje4_cck_store_item_users", force: :cascade do |t|
    t.string   "cck",         limit: 50,    null: false
    t.string   "gender",      limit: 255,   null: false
    t.string   "last_name",   limit: 255,   null: false
    t.string   "first_name",  limit: 255,   null: false
    t.text     "about_me",    limit: 65535, null: false
    t.string   "avatar",      limit: 255,   null: false
    t.text     "address1",    limit: 65535, null: false
    t.text     "address2",    limit: 65535, null: false
    t.string   "city",        limit: 255,   null: false
    t.string   "postal_code", limit: 255,   null: false
    t.string   "region",      limit: 255,   null: false
    t.string   "country",     limit: 255,   null: false
    t.string   "phone",       limit: 255,   null: false
    t.string   "website",     limit: 255,   null: false
    t.datetime "birthdate",                 null: false
    t.string   "birthplace",  limit: 255,   null: false
  end

  create_table "wlje4_cck_store_join_article_title", id: false, force: :cascade do |t|
    t.integer "id",  limit: 4, null: false
    t.integer "id2", limit: 4, null: false
  end

  create_table "wlje4_cck_store_join_id", force: :cascade do |t|
    t.integer "id2", limit: 4, null: false
  end

  create_table "wlje4_cck_store_join_test", force: :cascade do |t|
    t.integer "id2", limit: 4, null: false
  end

  add_index "wlje4_cck_store_join_test", ["id"], name: "PRIMARY 2", using: :btree

  create_table "wlje4_community_access_log", id: false, force: :cascade do |t|
    t.string   "user_hash",  limit: 50, null: false
    t.string   "controller", limit: 50, null: false
    t.string   "task",       limit: 50
    t.datetime "datetime",              null: false
    t.string   "domain",     limit: 50, null: false
  end

  create_table "wlje4_community_activities", force: :cascade do |t|
    t.integer  "actor",        limit: 4,                     null: false
    t.integer  "target",       limit: 4,                     null: false
    t.text     "title",        limit: 65535,                 null: false
    t.text     "content",      limit: 65535,                 null: false
    t.string   "app",          limit: 200,                   null: false
    t.string   "verb",         limit: 200,                   null: false
    t.integer  "cid",          limit: 4,                     null: false
    t.integer  "groupid",      limit: 4
    t.integer  "eventid",      limit: 4
    t.integer  "group_access", limit: 1,     default: 0,     null: false
    t.integer  "event_access", limit: 1,     default: 0,     null: false
    t.datetime "created",                                    null: false
    t.integer  "access",       limit: 1,                     null: false
    t.text     "params",       limit: 65535,                 null: false
    t.integer  "points",       limit: 4,     default: 1,     null: false
    t.integer  "archived",     limit: 1,                     null: false
    t.text     "location",     limit: 65535,                 null: false
    t.float    "latitude",     limit: 24,    default: 255.0, null: false
    t.float    "longitude",    limit: 24,    default: 255.0, null: false
    t.integer  "comment_id",   limit: 4,                     null: false
    t.string   "comment_type", limit: 200,                   null: false
    t.integer  "like_id",      limit: 4,                     null: false
    t.string   "like_type",    limit: 200,                   null: false
    t.text     "actors",       limit: 65535,                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "wlje4_community_activities", ["actor"], name: "actor", using: :btree
  add_index "wlje4_community_activities", ["app"], name: "app", using: :btree
  add_index "wlje4_community_activities", ["archived"], name: "archived", using: :btree
  add_index "wlje4_community_activities", ["created"], name: "created", using: :btree
  add_index "wlje4_community_activities", ["target"], name: "target", using: :btree

  create_table "wlje4_community_activities_MIA202", id: false, force: :cascade do |t|
    t.integer  "id",           limit: 4
    t.integer  "actor",        limit: 4
    t.integer  "target",       limit: 4
    t.binary   "title",        limit: 65535
    t.binary   "content",      limit: 65535
    t.binary   "app",          limit: 65535
    t.binary   "verb",         limit: 65535
    t.integer  "cid",          limit: 4
    t.integer  "groupid",      limit: 4
    t.integer  "eventid",      limit: 4
    t.integer  "group_access", limit: 4
    t.integer  "event_access", limit: 4
    t.datetime "created"
    t.integer  "access",       limit: 4
    t.binary   "params",       limit: 65535
    t.integer  "points",       limit: 4
    t.integer  "archived",     limit: 4
    t.binary   "location",     limit: 65535
    t.integer  "latitude",     limit: 4
    t.integer  "longitude",    limit: 4
    t.integer  "comment_id",   limit: 4
    t.binary   "comment_type", limit: 65535
    t.integer  "like_id",      limit: 4
    t.binary   "like_type",    limit: 65535
    t.binary   "actors",       limit: 65535
  end

  create_table "wlje4_community_activities_MIA404", id: false, force: :cascade do |t|
    t.integer  "id",           limit: 4
    t.integer  "actor",        limit: 4
    t.integer  "target",       limit: 4
    t.text     "title",        limit: 65535
    t.text     "content",      limit: 65535
    t.string   "app",          limit: 50
    t.string   "verb",         limit: 50
    t.integer  "cid",          limit: 4
    t.integer  "groupid",      limit: 4
    t.integer  "eventid",      limit: 4
    t.integer  "group_access", limit: 4
    t.integer  "event_access", limit: 4
    t.datetime "created"
    t.integer  "access",       limit: 4
    t.text     "params",       limit: 65535
    t.integer  "points",       limit: 4
    t.integer  "archived",     limit: 4
    t.string   "location",     limit: 50
    t.integer  "latitude",     limit: 4
    t.integer  "longitude",    limit: 4
    t.integer  "comment_id",   limit: 4
    t.string   "comment_type", limit: 50
    t.integer  "like_id",      limit: 4
    t.string   "like_type",    limit: 50
    t.text     "actors",       limit: 65535
  end

  create_table "wlje4_community_activities_hide", id: false, force: :cascade do |t|
    t.integer "activity_id", limit: 4, null: false
    t.integer "user_id",     limit: 4, null: false
  end

  add_index "wlje4_community_activities_hide", ["user_id"], name: "user_id", using: :btree

  create_table "wlje4_community_activities_import_MIA", id: false, force: :cascade do |t|
    t.integer  "id",           limit: 4
    t.string   "Column1",      limit: 50
    t.string   "actor",        limit: 2500
    t.integer  "target",       limit: 4
    t.string   "title",        limit: 5000
    t.text     "content",      limit: 65535
    t.string   "app",          limit: 50
    t.string   "verb",         limit: 50
    t.integer  "cid",          limit: 4
    t.integer  "groupid",      limit: 4
    t.integer  "eventid",      limit: 4
    t.integer  "group_access", limit: 4
    t.integer  "event_access", limit: 4
    t.datetime "created"
    t.integer  "access",       limit: 4
    t.string   "params",       limit: 5000
    t.integer  "points",       limit: 4
    t.integer  "archived",     limit: 4
    t.string   "location",     limit: 50
    t.integer  "latitude",     limit: 4
    t.integer  "longitude",    limit: 4
    t.integer  "comment_id",   limit: 4
    t.string   "comment_type", limit: 50
    t.integer  "like_id",      limit: 4
    t.string   "like_type",    limit: 50
    t.string   "actors",       limit: 2500
  end

  create_table "wlje4_community_advertisement", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,                              null: false
    t.string   "title",           limit: 60,                             null: false
    t.string   "categories",      limit: 200
    t.integer  "date_expiration", limit: 4
    t.text     "description",     limit: 65535,                          null: false
    t.string   "img",             limit: 150,   default: "no_image.png", null: false
    t.datetime "cdate",                                                  null: false
    t.string   "location",        limit: 155,                            null: false
    t.string   "ad_type",         limit: 10,                             null: false
  end

  create_table "wlje4_community_apps", force: :cascade do |t|
    t.integer "userid",   limit: 4,                         null: false
    t.string  "apps",     limit: 200,                       null: false
    t.integer "ordering", limit: 4,                         null: false
    t.string  "position", limit: 50,    default: "content", null: false
    t.text    "params",   limit: 65535,                     null: false
    t.string  "privacy",  limit: 200,                       null: false
  end

  add_index "wlje4_community_apps", ["userid", "apps"], name: "idx_user_apps", using: :btree
  add_index "wlje4_community_apps", ["userid"], name: "idx_userid", using: :btree

  create_table "wlje4_community_avatar", id: false, force: :cascade do |t|
    t.integer "id",      limit: 4,     null: false
    t.string  "apptype", limit: 255,   null: false
    t.text    "path",    limit: 65535, null: false
    t.integer "type",    limit: 1,     null: false
  end

  add_index "wlje4_community_avatar", ["id", "apptype", "type"], name: "id", unique: true, using: :btree

  create_table "wlje4_community_badges", force: :cascade do |t|
    t.string  "title",     limit: 64,              null: false
    t.integer "points",    limit: 4,   default: 0, null: false
    t.string  "image",     limit: 256,             null: false
    t.integer "published", limit: 1,   default: 0, null: false
  end

  add_index "wlje4_community_badges", ["points"], name: "points", unique: true, using: :btree

  create_table "wlje4_community_blocklist", force: :cascade do |t|
    t.integer "userid",         limit: 4,  null: false
    t.integer "blocked_userid", limit: 4,  null: false
    t.string  "type",           limit: 50, null: false
  end

  add_index "wlje4_community_blocklist", ["blocked_userid"], name: "blocked_userid", using: :btree
  add_index "wlje4_community_blocklist", ["userid"], name: "userid", using: :btree

  create_table "wlje4_community_config", primary_key: "name", force: :cascade do |t|
    t.text "params", limit: 4294967295, null: false
  end

  create_table "wlje4_community_connect_users", id: false, force: :cascade do |t|
    t.integer "connectid", limit: 8,   null: false
    t.string  "type",      limit: 255, null: false
    t.integer "userid",    limit: 4,   null: false
  end

  add_index "wlje4_community_connect_users", ["type"], name: "type", using: :btree

  create_table "wlje4_community_connection", primary_key: "connection_id", force: :cascade do |t|
    t.integer  "connect_from", limit: 4,     null: false
    t.integer  "connect_to",   limit: 4,     null: false
    t.integer  "status",       limit: 1,     null: false
    t.integer  "group",        limit: 4,     null: false
    t.text     "msg",          limit: 65535, null: false
    t.datetime "created"
  end

  add_index "wlje4_community_connection", ["connect_from", "connect_to", "status", "group"], name: "connect_from", using: :btree
  add_index "wlje4_community_connection", ["connect_from"], name: "idx_connect_from", using: :btree
  add_index "wlje4_community_connection", ["connect_to", "connect_from"], name: "idx_connect_tofrom", using: :btree
  add_index "wlje4_community_connection", ["connect_to"], name: "idx_connect_to", using: :btree

  create_table "wlje4_community_engagement", force: :cascade do |t|
    t.string   "action",  limit: 64, null: false
    t.integer  "user_id", limit: 4,  null: false
    t.datetime "created",            null: false
    t.integer  "week",    limit: 1,  null: false
  end

  add_index "wlje4_community_engagement", ["user_id"], name: "user_id", using: :btree

  create_table "wlje4_community_event_stats", force: :cascade do |t|
    t.integer  "eid",        limit: 4,     null: false
    t.string   "type",       limit: 255,   null: false
    t.integer  "count",      limit: 4,     null: false
    t.date     "date",                     null: false
    t.text     "params",     limit: 65535, null: false
    t.datetime "created_at",               null: false
  end

  create_table "wlje4_community_events", force: :cascade do |t|
    t.integer  "parent",         limit: 4,                         null: false
    t.integer  "catid",          limit: 4,                         null: false
    t.integer  "contentid",      limit: 4,     default: 0
    t.string   "type",           limit: 255,   default: "profile", null: false
    t.string   "title",          limit: 255,                       null: false
    t.text     "location",       limit: 65535,                     null: false
    t.text     "summary",        limit: 65535,                     null: false
    t.text     "description",    limit: 65535
    t.integer  "creator",        limit: 4,                         null: false
    t.datetime "startdate",                                        null: false
    t.datetime "enddate",                                          null: false
    t.integer  "permission",     limit: 1,     default: 0,         null: false
    t.string   "avatar",         limit: 255
    t.string   "thumb",          limit: 255
    t.text     "cover",          limit: 65535,                     null: false
    t.integer  "invitedcount",   limit: 4,     default: 0
    t.integer  "confirmedcount", limit: 4,     default: 0
    t.integer  "declinedcount",  limit: 4,     default: 0
    t.integer  "maybecount",     limit: 4,     default: 0
    t.integer  "wallcount",      limit: 4,     default: 0
    t.integer  "ticket",         limit: 4,     default: 0
    t.boolean  "allowinvite",                  default: true
    t.datetime "created"
    t.integer  "hits",           limit: 4,     default: 0
    t.integer  "published",      limit: 4,     default: 1
    t.float    "latitude",       limit: 24,    default: 255.0,     null: false
    t.float    "longitude",      limit: 24,    default: 255.0,     null: false
    t.string   "offset",         limit: 5
    t.integer  "allday",         limit: 1,     default: 0,         null: false
    t.string   "repeat",         limit: 50
    t.date     "repeatend",                                        null: false
    t.text     "params",         limit: 65535,                     null: false
    t.string   "storage",        limit: 64,    default: "file",    null: false
    t.integer  "unlisted",       limit: 1,                         null: false
  end

  add_index "wlje4_community_events", ["catid"], name: "idx_catid", using: :btree
  add_index "wlje4_community_events", ["creator"], name: "idx_creator", using: :btree
  add_index "wlje4_community_events", ["published"], name: "idx_published", using: :btree
  add_index "wlje4_community_events", ["startdate", "enddate"], name: "idx_period", using: :btree
  add_index "wlje4_community_events", ["type"], name: "idx_type", using: :btree

  create_table "wlje4_community_events_category", force: :cascade do |t|
    t.integer "parent",      limit: 4,     default: 0, null: false
    t.string  "name",        limit: 255,               null: false
    t.text    "description", limit: 65535,             null: false
  end

  create_table "wlje4_community_events_members", force: :cascade do |t|
    t.integer  "eventid",    limit: 4,                 null: false
    t.integer  "memberid",   limit: 4,                 null: false
    t.boolean  "status",               default: false, null: false
    t.boolean  "permission",           default: false, null: false
    t.integer  "invited_by", limit: 4, default: 0
    t.boolean  "approval",             default: false
    t.datetime "created"
  end

  add_index "wlje4_community_events_members", ["eventid", "memberid"], name: "idx_member_event", using: :btree
  add_index "wlje4_community_events_members", ["eventid", "permission"], name: "idx_permission", using: :btree
  add_index "wlje4_community_events_members", ["eventid"], name: "idx_eventid", using: :btree
  add_index "wlje4_community_events_members", ["invited_by"], name: "idx_invitedby", using: :btree
  add_index "wlje4_community_events_members", ["status"], name: "idx_status", using: :btree

  create_table "wlje4_community_featured", force: :cascade do |t|
    t.integer  "cid",        limit: 4,   null: false
    t.integer  "created_by", limit: 4,   null: false
    t.integer  "target_id",  limit: 4,   null: false
    t.string   "type",       limit: 255, null: false
    t.datetime "created",                null: false
  end

  add_index "wlje4_community_featured", ["type"], name: "type", using: :btree

  create_table "wlje4_community_fields", force: :cascade do |t|
    t.string  "type",         limit: 255,                   null: false
    t.integer "ordering",     limit: 4,     default: 0
    t.boolean "published",                  default: false, null: false
    t.integer "min",          limit: 4,                     null: false
    t.integer "max",          limit: 4,                     null: false
    t.string  "name",         limit: 255,                   null: false
    t.text    "tips",         limit: 65535,                 null: false
    t.boolean "visible",                    default: false
    t.boolean "required",                   default: false
    t.boolean "searchable",                 default: true
    t.boolean "registration",               default: true
    t.text    "options",      limit: 65535
    t.string  "fieldcode",    limit: 255,                   null: false
    t.text    "params",       limit: 65535,                 null: false
  end

  add_index "wlje4_community_fields", ["fieldcode"], name: "fieldcode", using: :btree

  create_table "wlje4_community_fields_values", force: :cascade do |t|
    t.integer "user_id",  limit: 4,                 null: false
    t.integer "field_id", limit: 4,                 null: false
    t.text    "value",    limit: 65535,             null: false
    t.integer "access",   limit: 1,     default: 0, null: false
  end

  add_index "wlje4_community_fields_values", ["access"], name: "access", using: :btree
  add_index "wlje4_community_fields_values", ["field_id"], name: "field_id", using: :btree
  add_index "wlje4_community_fields_values", ["user_id", "field_id"], name: "idx_user_fieldid", using: :btree
  add_index "wlje4_community_fields_values", ["user_id"], name: "user_id", using: :btree

  create_table "wlje4_community_files", force: :cascade do |t|
    t.string   "name",         limit: 255, null: false
    t.integer  "groupid",      limit: 4,   null: false
    t.integer  "discussionid", limit: 4,   null: false
    t.integer  "bulletinid",   limit: 4,   null: false
    t.integer  "eventid",      limit: 4,   null: false
    t.integer  "profileid",    limit: 4,   null: false
    t.integer  "messageid",    limit: 4,   null: false
    t.string   "filepath",     limit: 255, null: false
    t.integer  "filesize",     limit: 4,   null: false
    t.integer  "hits",         limit: 4,   null: false
    t.string   "storage",      limit: 64,  null: false
    t.integer  "creator",      limit: 4,   null: false
    t.datetime "created",                  null: false
    t.string   "type",         limit: 255
  end

  add_index "wlje4_community_files", ["bulletinid"], name: "bulletinid", using: :btree
  add_index "wlje4_community_files", ["creator"], name: "creator", using: :btree
  add_index "wlje4_community_files", ["discussionid"], name: "discussionid", using: :btree
  add_index "wlje4_community_files", ["groupid"], name: "groupid", using: :btree

  create_table "wlje4_community_group_stats", force: :cascade do |t|
    t.integer  "gid",        limit: 4,     null: false
    t.string   "type",       limit: 255,   null: false
    t.integer  "count",      limit: 4,     null: false
    t.date     "date",                     null: false
    t.text     "params",     limit: 65535, null: false
    t.datetime "created_at",               null: false
  end

  create_table "wlje4_community_groups", force: :cascade do |t|
    t.boolean  "published",                                   null: false
    t.integer  "ownerid",      limit: 4,                      null: false
    t.integer  "categoryid",   limit: 4,                      null: false
    t.string   "name",         limit: 255,                    null: false
    t.text     "description",  limit: 65535,                  null: false
    t.string   "email",        limit: 255,                    null: false
    t.string   "website",      limit: 255,                    null: false
    t.boolean  "approvals",                                   null: false
    t.datetime "created",                                     null: false
    t.text     "avatar",       limit: 65535,                  null: false
    t.text     "thumb",        limit: 65535,                  null: false
    t.text     "cover",        limit: 65535,                  null: false
    t.integer  "discusscount", limit: 4,     default: 0,      null: false
    t.integer  "wallcount",    limit: 4,     default: 0,      null: false
    t.integer  "membercount",  limit: 4,     default: 0,      null: false
    t.text     "params",       limit: 65535,                  null: false
    t.string   "storage",      limit: 64,    default: "file", null: false
    t.integer  "hits",         limit: 4,                      null: false
    t.text     "summary",      limit: 65535,                  null: false
    t.integer  "unlisted",     limit: 1,                      null: false
  end

  create_table "wlje4_community_groups_bulletins", force: :cascade do |t|
    t.integer  "groupid",    limit: 4,     null: false
    t.integer  "created_by", limit: 4,     null: false
    t.boolean  "published",                null: false
    t.string   "title",      limit: 255,   null: false
    t.text     "message",    limit: 65535, null: false
    t.datetime "date",                     null: false
    t.text     "params",     limit: 65535, null: false
  end

  add_index "wlje4_community_groups_bulletins", ["groupid"], name: "groupid", using: :btree

  create_table "wlje4_community_groups_category", force: :cascade do |t|
    t.integer "parent",      limit: 4,     default: 0, null: false
    t.string  "name",        limit: 255,               null: false
    t.text    "description", limit: 65535,             null: false
  end

  create_table "wlje4_community_groups_discuss", force: :cascade do |t|
    t.integer  "parentid",    limit: 4,     default: 0,     null: false
    t.integer  "groupid",     limit: 4,                     null: false
    t.integer  "creator",     limit: 4,                     null: false
    t.datetime "created",                                   null: false
    t.text     "title",       limit: 65535,                 null: false
    t.text     "message",     limit: 65535,                 null: false
    t.datetime "lastreplied",                               null: false
    t.boolean  "lock",                      default: false, null: false
    t.text     "params",      limit: 65535,                 null: false
  end

  add_index "wlje4_community_groups_discuss", ["groupid"], name: "groupid", using: :btree
  add_index "wlje4_community_groups_discuss", ["parentid"], name: "parentid", using: :btree

  create_table "wlje4_community_groups_invite", id: false, force: :cascade do |t|
    t.integer "groupid", limit: 4, null: false
    t.integer "userid",  limit: 4, null: false
    t.integer "creator", limit: 4, null: false
  end

  create_table "wlje4_community_groups_members", id: false, force: :cascade do |t|
    t.integer "groupid",     limit: 4, null: false
    t.integer "memberid",    limit: 4, null: false
    t.integer "approved",    limit: 4, null: false
    t.integer "permissions", limit: 4, null: false
  end

  add_index "wlje4_community_groups_members", ["groupid"], name: "groupid", using: :btree
  add_index "wlje4_community_groups_members", ["memberid"], name: "idx_memberid", using: :btree

  create_table "wlje4_community_hashtag", force: :cascade do |t|
    t.string   "tag",        limit: 128,   null: false
    t.text     "params",     limit: 65535, null: false
    t.datetime "created_at",               null: false
  end

  add_index "wlje4_community_hashtag", ["tag"], name: "tag", unique: true, using: :btree

  create_table "wlje4_community_invitations", force: :cascade do |t|
    t.string  "callback", limit: 255,   null: false
    t.integer "cid",      limit: 4,     null: false
    t.text    "users",    limit: 65535, null: false
  end

  create_table "wlje4_community_likes", force: :cascade do |t|
    t.string  "element", limit: 200,   null: false
    t.integer "uid",     limit: 4,     null: false
    t.text    "like",    limit: 65535, null: false
    t.text    "dislike", limit: 65535, null: false
  end

  add_index "wlje4_community_likes", ["element", "uid"], name: "element", using: :btree

  create_table "wlje4_community_location_cache", id: false, force: :cascade do |t|
    t.string   "address",   limit: 255,                   null: false
    t.float    "latitude",  limit: 24,    default: 255.0, null: false
    t.float    "longitude", limit: 24,    default: 255.0, null: false
    t.text     "data",      limit: 65535,                 null: false
    t.string   "status",    limit: 2,                     null: false
    t.datetime "created",                                 null: false
  end

  create_table "wlje4_community_mailq", force: :cascade do |t|
    t.text     "recipient",  limit: 65535, null: false
    t.text     "subject",    limit: 65535, null: false
    t.text     "body",       limit: 65535, null: false
    t.integer  "status",     limit: 1,     null: false
    t.datetime "created",                  null: false
    t.string   "template",   limit: 64,    null: false
    t.text     "email_type", limit: 65535
    t.text     "params",     limit: 65535, null: false
  end

  create_table "wlje4_community_memberlist", force: :cascade do |t|
    t.text     "title",       limit: 65535, null: false
    t.text     "description", limit: 65535, null: false
    t.string   "condition",   limit: 255,   null: false
    t.integer  "avataronly",  limit: 4,     null: false
    t.datetime "created",                   null: false
  end

  create_table "wlje4_community_memberlist_criteria", force: :cascade do |t|
    t.integer "listid",    limit: 4,   null: false
    t.string  "field",     limit: 255, null: false
    t.string  "condition", limit: 255, null: false
    t.string  "value",     limit: 255, null: false
    t.string  "type",      limit: 255, null: false
  end

  add_index "wlje4_community_memberlist_criteria", ["listid"], name: "listid", using: :btree

  create_table "wlje4_community_moods", force: :cascade do |t|
    t.string  "title",           limit: 128,             null: false
    t.string  "description",     limit: 128,             null: false
    t.string  "image",           limit: 256
    t.integer "custom",          limit: 1,               null: false
    t.integer "published",       limit: 1,   default: 1, null: false
    t.integer "allowcustomtext", limit: 1,   default: 0, null: false
    t.integer "ordering",        limit: 4,   default: 0, null: false
  end

  create_table "wlje4_community_msg", force: :cascade do |t|
    t.integer  "from",      limit: 4,                 null: false
    t.integer  "parent",    limit: 4,                 null: false
    t.integer  "deleted",   limit: 1,     default: 0
    t.string   "from_name", limit: 45,                null: false
    t.datetime "posted_on"
    t.text     "subject",   limit: 255,               null: false
    t.text     "body",      limit: 65535,             null: false
  end

  create_table "wlje4_community_msg_recepient", id: false, force: :cascade do |t|
    t.integer "msg_id",     limit: 4,             null: false
    t.integer "msg_parent", limit: 4, default: 0, null: false
    t.integer "msg_from",   limit: 4,             null: false
    t.integer "to",         limit: 4,             null: false
    t.integer "bcc",        limit: 1, default: 0
    t.integer "is_read",    limit: 1, default: 0
    t.integer "deleted",    limit: 1, default: 0
  end

  add_index "wlje4_community_msg_recepient", ["is_read", "to", "deleted"], name: "idx_isread_to_deleted", using: :btree
  add_index "wlje4_community_msg_recepient", ["msg_id", "to"], name: "un", unique: true, using: :btree
  add_index "wlje4_community_msg_recepient", ["msg_id"], name: "msg_id", using: :btree
  add_index "wlje4_community_msg_recepient", ["to"], name: "to", using: :btree

  create_table "wlje4_community_notifications", force: :cascade do |t|
    t.integer  "actor",    limit: 4,     null: false
    t.integer  "target",   limit: 4,     null: false
    t.text     "content",  limit: 65535, null: false
    t.string   "type",     limit: 200,   null: false
    t.text     "cmd_type", limit: 65535, null: false
    t.integer  "status",   limit: 1,     null: false
    t.datetime "created",                null: false
    t.text     "params",   limit: 65535, null: false
  end

  add_index "wlje4_community_notifications", ["actor"], name: "actor", using: :btree
  add_index "wlje4_community_notifications", ["created"], name: "created", using: :btree
  add_index "wlje4_community_notifications", ["status"], name: "status", using: :btree
  add_index "wlje4_community_notifications", ["target"], name: "target", using: :btree
  add_index "wlje4_community_notifications", ["type"], name: "type", using: :btree

  create_table "wlje4_community_oauth", primary_key: "userid", force: :cascade do |t|
    t.text   "requesttoken", limit: 65535, null: false
    t.text   "accesstoken",  limit: 65535, null: false
    t.string "app",          limit: 255,   null: false
  end

  create_table "wlje4_community_photo_stats", force: :cascade do |t|
    t.integer  "pid",        limit: 4,     null: false
    t.string   "type",       limit: 255,   null: false
    t.integer  "count",      limit: 4,     null: false
    t.date     "date",                     null: false
    t.text     "params",     limit: 65535, null: false
    t.datetime "created_at",               null: false
  end

  create_table "wlje4_community_photos", force: :cascade do |t|
    t.integer  "albumid",     limit: 4,                      null: false
    t.text     "caption",     limit: 65535,                  null: false
    t.boolean  "published",                                  null: false
    t.integer  "creator",     limit: 4,                      null: false
    t.string   "permissions", limit: 255,                    null: false
    t.string   "image",       limit: 255,                    null: false
    t.string   "thumbnail",   limit: 255,                    null: false
    t.string   "original",    limit: 255,                    null: false
    t.integer  "filesize",    limit: 4,     default: 0,      null: false
    t.string   "storage",     limit: 64,    default: "file", null: false
    t.datetime "created",                                    null: false
    t.integer  "ordering",    limit: 4,     default: 0,      null: false
    t.integer  "hits",        limit: 4,     default: 0,      null: false
    t.string   "status",      limit: 200,                    null: false
    t.text     "params",      limit: 65535,                  null: false
  end

  add_index "wlje4_community_photos", ["albumid"], name: "albumid", using: :btree
  add_index "wlje4_community_photos", ["storage"], name: "idx_storage", using: :btree

  create_table "wlje4_community_photos_albums", force: :cascade do |t|
    t.integer  "photoid",     limit: 4,                     null: false
    t.integer  "creator",     limit: 4,                     null: false
    t.string   "name",        limit: 255,                   null: false
    t.text     "description", limit: 65535,                 null: false
    t.string   "permissions", limit: 255,                   null: false
    t.datetime "created",                                   null: false
    t.string   "path",        limit: 255,                   null: false
    t.string   "type",        limit: 255,                   null: false
    t.integer  "groupid",     limit: 4,     default: 0,     null: false
    t.integer  "eventid",     limit: 4,                     null: false
    t.integer  "hits",        limit: 4,     default: 0,     null: false
    t.text     "location",    limit: 65535,                 null: false
    t.float    "latitude",    limit: 24,    default: 255.0, null: false
    t.float    "longitude",   limit: 24,    default: 255.0, null: false
    t.boolean  "default",                   default: false, null: false
    t.text     "params",      limit: 65535,                 null: false
  end

  add_index "wlje4_community_photos_albums", ["creator", "type"], name: "idx_creatortype", using: :btree
  add_index "wlje4_community_photos_albums", ["creator"], name: "creator", using: :btree
  add_index "wlje4_community_photos_albums", ["groupid"], name: "idx_groupid", using: :btree
  add_index "wlje4_community_photos_albums", ["id", "type"], name: "idx_albumtype", using: :btree
  add_index "wlje4_community_photos_albums", ["type"], name: "idx_type", using: :btree

  create_table "wlje4_community_photos_tag", force: :cascade do |t|
    t.integer  "photoid",    limit: 4,  null: false
    t.integer  "userid",     limit: 4,  null: false
    t.string   "position",   limit: 50, null: false
    t.integer  "created_by", limit: 4,  null: false
    t.datetime "created",               null: false
  end

  add_index "wlje4_community_photos_tag", ["created_by"], name: "idx_created_by", using: :btree
  add_index "wlje4_community_photos_tag", ["photoid", "userid"], name: "idx_photo_user", using: :btree
  add_index "wlje4_community_photos_tag", ["photoid"], name: "idx_photoid", using: :btree
  add_index "wlje4_community_photos_tag", ["userid"], name: "idx_userid", using: :btree

  create_table "wlje4_community_photos_tokens", id: false, force: :cascade do |t|
    t.integer  "userid",   limit: 4,   null: false
    t.string   "token",    limit: 200, null: false
    t.datetime "datetime",             null: false
  end

  create_table "wlje4_community_profile_stats", force: :cascade do |t|
    t.integer  "uid",        limit: 4,     null: false
    t.string   "type",       limit: 255,   null: false
    t.integer  "count",      limit: 4,     null: false
    t.date     "date",                     null: false
    t.text     "params",     limit: 65535, null: false
    t.datetime "created_at",               null: false
  end

  create_table "wlje4_community_profiles", force: :cascade do |t|
    t.string   "name",               limit: 255,                   null: false
    t.text     "description",        limit: 65535,                 null: false
    t.integer  "approvals",          limit: 1,                     null: false
    t.integer  "published",          limit: 1,                     null: false
    t.text     "avatar",             limit: 65535,                 null: false
    t.text     "watermark",          limit: 65535,                 null: false
    t.string   "watermark_hash",     limit: 255,                   null: false
    t.text     "watermark_location", limit: 65535,                 null: false
    t.text     "thumb",              limit: 65535,                 null: false
    t.datetime "created",                                          null: false
    t.boolean  "create_groups",                    default: true
    t.integer  "create_events",      limit: 4,     default: 1
    t.boolean  "profile_lock",                     default: false
    t.integer  "ordering",           limit: 4,                     null: false
  end

  add_index "wlje4_community_profiles", ["approvals", "published"], name: "approvals", using: :btree

  create_table "wlje4_community_profiles_fields", force: :cascade do |t|
    t.integer "parent",   limit: 4, null: false
    t.integer "field_id", limit: 4, null: false
  end

  add_index "wlje4_community_profiles_fields", ["field_id"], name: "field_id", using: :btree
  add_index "wlje4_community_profiles_fields", ["parent"], name: "multiprofile_id", using: :btree

  create_table "wlje4_community_register", force: :cascade do |t|
    t.string   "token",     limit: 200, null: false
    t.string   "name",      limit: 255, null: false
    t.string   "firstname", limit: 180, null: false
    t.string   "lastname",  limit: 180, null: false
    t.string   "username",  limit: 150, null: false
    t.string   "email",     limit: 100, null: false
    t.string   "password",  limit: 100, null: false
    t.datetime "created"
    t.string   "ip",        limit: 25,  null: false
  end

  create_table "wlje4_community_register_auth_token", primary_key: "token", force: :cascade do |t|
    t.string   "ip",       limit: 255, null: false
    t.string   "auth_key", limit: 200, null: false
    t.datetime "created",              null: false
  end

  add_index "wlje4_community_register_auth_token", ["ip"], name: "ip", using: :btree

  create_table "wlje4_community_reports", force: :cascade do |t|
    t.string   "uniquestring", limit: 200, null: false
    t.string   "link",         limit: 255, null: false
    t.integer  "status",       limit: 4,   null: false
    t.datetime "created",                  null: false
  end

  create_table "wlje4_community_reports_actions", force: :cascade do |t|
    t.integer "reportid",      limit: 4,   null: false
    t.string  "label",         limit: 255, null: false
    t.string  "method",        limit: 255, null: false
    t.string  "parameters",    limit: 255, null: false
    t.boolean "defaultaction",             null: false
  end

  create_table "wlje4_community_reports_reporter", id: false, force: :cascade do |t|
    t.integer  "reportid",   limit: 4,     null: false
    t.text     "message",    limit: 65535, null: false
    t.integer  "created_by", limit: 4,     null: false
    t.datetime "created",                  null: false
    t.string   "ip",         limit: 255,   null: false
  end

  create_table "wlje4_community_storage_s3", id: false, force: :cascade do |t|
    t.string "storageid",     limit: 255, null: false
    t.string "resource_path", limit: 255, null: false
  end

  add_index "wlje4_community_storage_s3", ["storageid"], name: "storageid", unique: true, using: :btree

  create_table "wlje4_community_tags", force: :cascade do |t|
    t.string   "element", limit: 200, null: false
    t.integer  "userid",  limit: 4,   null: false
    t.integer  "cid",     limit: 4,   null: false
    t.datetime "created",             null: false
    t.string   "tag",     limit: 200, null: false
  end

  create_table "wlje4_community_tags_words", force: :cascade do |t|
    t.string   "tag",      limit: 200, null: false
    t.integer  "count",    limit: 4,   null: false
    t.datetime "modified",             null: false
  end

  create_table "wlje4_community_theme", force: :cascade do |t|
    t.string "key",   limit: 32,    null: false
    t.text   "value", limit: 65535, null: false
  end

  add_index "wlje4_community_theme", ["key"], name: "key", unique: true, using: :btree

  create_table "wlje4_community_user_status", force: :cascade do |t|
    t.integer "userid",    limit: 4,                     null: false
    t.text    "status",    limit: 65535,                 null: false
    t.integer "posted_on", limit: 4,                     null: false
    t.text    "location",  limit: 65535,                 null: false
    t.float   "latitude",  limit: 24,    default: 255.0, null: false
    t.float   "longitude", limit: 24,    default: 255.0, null: false
  end

  add_index "wlje4_community_user_status", ["userid"], name: "userid", using: :btree

  create_table "wlje4_community_userpoints", force: :cascade do |t|
    t.string  "rule_name",        limit: 255,   default: "",    null: false
    t.text    "rule_description", limit: 65535,                 null: false
    t.string  "rule_plugin",      limit: 255,   default: "",    null: false
    t.string  "action_string",    limit: 255,   default: "",    null: false
    t.string  "component",        limit: 255,   default: "",    null: false
    t.boolean "access",                         default: true,  null: false
    t.integer "points",           limit: 4,     default: 0,     null: false
    t.boolean "published",                      default: false, null: false
    t.boolean "system",                         default: false, null: false
  end

  create_table "wlje4_community_users", primary_key: "userid", force: :cascade do |t|
    t.text     "status",         limit: 65535,                  null: false
    t.integer  "status_access",  limit: 4,     default: 0,      null: false
    t.integer  "points",         limit: 4,                      null: false
    t.datetime "posted_on",                                     null: false
    t.text     "avatar",         limit: 65535,                  null: false
    t.text     "thumb",          limit: 65535,                  null: false
    t.text     "cover",          limit: 65535,                  null: false
    t.integer  "invite",         limit: 4,     default: 0,      null: false
    t.text     "params",         limit: 65535,                  null: false
    t.integer  "view",           limit: 4,     default: 0,      null: false
    t.text     "friends",        limit: 65535,                  null: false
    t.text     "groups",         limit: 65535,                  null: false
    t.text     "events",         limit: 65535,                  null: false
    t.integer  "friendcount",    limit: 4,     default: 0,      null: false
    t.string   "alias",          limit: 255,                    null: false
    t.float    "latitude",       limit: 24,    default: 255.0,  null: false
    t.float    "longitude",      limit: 24,    default: 255.0,  null: false
    t.integer  "profile_id",     limit: 4,     default: 0,      null: false
    t.string   "storage",        limit: 64,    default: "file", null: false
    t.string   "watermark_hash", limit: 255,                    null: false
    t.boolean  "search_email",                 default: true,   null: false
  end

  add_index "wlje4_community_users", ["alias"], name: "alias", using: :btree

  create_table "wlje4_community_users_TEST", id: false, force: :cascade do |t|
    t.integer "userid",         limit: 4
    t.string  "status",         limit: 476
    t.integer "status_access",  limit: 4
    t.integer "points",         limit: 4
    t.string  "posted_on",      limit: 50
    t.string  "avatar",         limit: 72
    t.string  "thumb",          limit: 78
    t.string  "cover",          limit: 92
    t.integer "invite",         limit: 4
    t.string  "params",         limit: 3874
    t.integer "view",           limit: 4
    t.string  "friends",        limit: 3258
    t.string  "groups",         limit: 123
    t.string  "events",         limit: 50
    t.integer "friendcount",    limit: 4
    t.string  "alias",          limit: 67
    t.decimal "latitude",                    precision: 28, scale: 10
    t.decimal "longitude",                   precision: 28, scale: 10
    t.integer "profile_id",     limit: 4
    t.string  "storage",        limit: 50
    t.string  "watermark_hash", limit: 50
    t.integer "search_email",   limit: 4
  end

  create_table "wlje4_community_video_stats", force: :cascade do |t|
    t.integer  "vid",        limit: 4,     null: false
    t.string   "type",       limit: 255,   null: false
    t.integer  "count",      limit: 4,     null: false
    t.date     "date",                     null: false
    t.text     "params",     limit: 65535, null: false
    t.datetime "created_at",               null: false
  end

  create_table "wlje4_community_videos", force: :cascade do |t|
    t.string   "title",        limit: 200,                       null: false
    t.string   "type",         limit: 200,   default: "file",    null: false
    t.string   "video_id",     limit: 200
    t.text     "description",  limit: 65535,                     null: false
    t.integer  "creator",      limit: 4,                         null: false
    t.string   "creator_type", limit: 200,   default: "user",    null: false
    t.datetime "created",                                        null: false
    t.string   "permissions",  limit: 255,   default: "0",       null: false
    t.integer  "category_id",  limit: 4,                         null: false
    t.integer  "hits",         limit: 4,     default: 0,         null: false
    t.integer  "published",    limit: 1,     default: 1,         null: false
    t.integer  "featured",     limit: 1,     default: 0,         null: false
    t.float    "duration",     limit: 24,    default: 0.0
    t.string   "status",       limit: 200,   default: "pending", null: false
    t.string   "thumb",        limit: 255
    t.string   "path",         limit: 255
    t.integer  "groupid",      limit: 4,     default: 0,         null: false
    t.integer  "eventid",      limit: 4,                         null: false
    t.integer  "filesize",     limit: 4,     default: 0,         null: false
    t.string   "storage",      limit: 64,    default: "file",    null: false
    t.text     "location",     limit: 65535,                     null: false
    t.float    "latitude",     limit: 24,    default: 255.0,     null: false
    t.float    "longitude",    limit: 24,    default: 255.0,     null: false
    t.text     "params",       limit: 65535,                     null: false
  end

  add_index "wlje4_community_videos", ["creator"], name: "creator", using: :btree
  add_index "wlje4_community_videos", ["groupid"], name: "idx_groupid", using: :btree
  add_index "wlje4_community_videos", ["storage"], name: "idx_storage", using: :btree

  create_table "wlje4_community_videos_category", force: :cascade do |t|
    t.integer "parent",      limit: 4,                 null: false
    t.string  "name",        limit: 255,               null: false
    t.text    "description", limit: 65535,             null: false
    t.integer "published",   limit: 1,     default: 1, null: false
  end

  create_table "wlje4_community_videos_tag", force: :cascade do |t|
    t.integer  "videoid",    limit: 4,     null: false
    t.integer  "userid",     limit: 4,     null: false
    t.text     "position",   limit: 65535, null: false
    t.integer  "created_by", limit: 4,     null: false
    t.datetime "created",                  null: false
  end

  create_table "wlje4_community_wall", force: :cascade do |t|
    t.integer "contentid", limit: 4,     default: 0, null: false
    t.integer "post_by",   limit: 4,     default: 0, null: false
    t.string  "ip",        limit: 45,                null: false
    t.text    "comment",   limit: 65535,             null: false
    t.string  "date",      limit: 45,                null: false
    t.boolean "published",                           null: false
    t.string  "type",      limit: 200,               null: false
    t.text    "params",    limit: 65535,             null: false
  end

  add_index "wlje4_community_wall", ["contentid"], name: "contentid", using: :btree
  add_index "wlje4_community_wall", ["type"], name: "type", using: :btree

  create_table "wlje4_contact_details", force: :cascade do |t|
    t.string   "name",             limit: 255,      default: "",    null: false
    t.string   "alias",            limit: 255,      default: "",    null: false
    t.string   "con_position",     limit: 255
    t.text     "address",          limit: 65535
    t.string   "suburb",           limit: 100
    t.string   "state",            limit: 100
    t.string   "country",          limit: 100
    t.string   "postcode",         limit: 100
    t.string   "telephone",        limit: 255
    t.string   "fax",              limit: 255
    t.text     "misc",             limit: 16777215
    t.string   "image",            limit: 255
    t.string   "email_to",         limit: 255
    t.boolean  "default_con",                       default: false, null: false
    t.boolean  "published",                         default: false, null: false
    t.integer  "checked_out",      limit: 4,        default: 0,     null: false
    t.datetime "checked_out_time",                                  null: false
    t.integer  "ordering",         limit: 4,        default: 0,     null: false
    t.text     "params",           limit: 65535,                    null: false
    t.integer  "user_id",          limit: 4,        default: 0,     null: false
    t.integer  "catid",            limit: 4,        default: 0,     null: false
    t.integer  "access",           limit: 4,        default: 0,     null: false
    t.string   "mobile",           limit: 255,      default: "",    null: false
    t.string   "webpage",          limit: 255,      default: "",    null: false
    t.string   "sortname1",        limit: 255,                      null: false
    t.string   "sortname2",        limit: 255,                      null: false
    t.string   "sortname3",        limit: 255,                      null: false
    t.string   "language",         limit: 7,                        null: false
    t.datetime "created",                                           null: false
    t.integer  "created_by",       limit: 4,        default: 0,     null: false
    t.string   "created_by_alias", limit: 255,      default: "",    null: false
    t.datetime "modified",                                          null: false
    t.integer  "modified_by",      limit: 4,        default: 0,     null: false
    t.text     "metakey",          limit: 65535,                    null: false
    t.text     "metadesc",         limit: 65535,                    null: false
    t.text     "metadata",         limit: 65535,                    null: false
    t.integer  "featured",         limit: 1,        default: 0,     null: false
    t.string   "xreference",       limit: 50,                       null: false
    t.datetime "publish_up",                                        null: false
    t.datetime "publish_down",                                      null: false
    t.integer  "version",          limit: 4,        default: 1,     null: false
    t.integer  "hits",             limit: 4,        default: 0,     null: false
  end

  add_index "wlje4_contact_details", ["access"], name: "idx_access", using: :btree
  add_index "wlje4_contact_details", ["catid"], name: "idx_catid", using: :btree
  add_index "wlje4_contact_details", ["checked_out"], name: "idx_checkout", using: :btree
  add_index "wlje4_contact_details", ["created_by"], name: "idx_createdby", using: :btree
  add_index "wlje4_contact_details", ["featured", "catid"], name: "idx_featured_catid", using: :btree
  add_index "wlje4_contact_details", ["language"], name: "idx_language", using: :btree
  add_index "wlje4_contact_details", ["published"], name: "idx_state", using: :btree
  add_index "wlje4_contact_details", ["xreference"], name: "idx_xreference", using: :btree

  create_table "wlje4_content", force: :cascade do |t|
    t.integer  "asset_id",         limit: 4,        default: 0,  null: false
    t.string   "title",            limit: 255,      default: ""
    t.string   "alias",            limit: 255,      default: ""
    t.text     "introtext",        limit: 16777215
    t.text     "fulltext",         limit: 16777215
    t.integer  "state",            limit: 1,        default: 0
    t.integer  "catid",            limit: 4,        default: 0
    t.datetime "created"
    t.integer  "created_by",       limit: 4,        default: 0
    t.string   "created_by_alias", limit: 255,      default: ""
    t.datetime "modified"
    t.integer  "modified_by",      limit: 4,        default: 0
    t.integer  "checked_out",      limit: 4,        default: 0
    t.datetime "checked_out_time"
    t.datetime "publish_up"
    t.datetime "publish_down"
    t.text     "images",           limit: 65535
    t.text     "urls",             limit: 65535
    t.string   "attribs",          limit: 5120
    t.integer  "version",          limit: 4,        default: 1
    t.integer  "ordering",         limit: 4,        default: 0
    t.text     "metakey",          limit: 65535
    t.text     "metadesc",         limit: 65535
    t.integer  "access",           limit: 4,        default: 0
    t.integer  "hits",             limit: 4,        default: 0
    t.text     "metadata",         limit: 65535
    t.integer  "featured",         limit: 1,        default: 0
    t.string   "language",         limit: 7
    t.string   "xreference",       limit: 50
  end

  add_index "wlje4_content", ["access"], name: "idx_access", using: :btree
  add_index "wlje4_content", ["catid"], name: "idx_catid", using: :btree
  add_index "wlje4_content", ["checked_out"], name: "idx_checkout", using: :btree
  add_index "wlje4_content", ["created_by"], name: "idx_createdby", using: :btree
  add_index "wlje4_content", ["featured", "catid"], name: "idx_featured_catid", using: :btree
  add_index "wlje4_content", ["language"], name: "idx_language", using: :btree
  add_index "wlje4_content", ["state"], name: "idx_state", using: :btree
  add_index "wlje4_content", ["xreference"], name: "idx_xreference", using: :btree

  create_table "wlje4_content_frontpage", primary_key: "content_id", force: :cascade do |t|
    t.integer "ordering", limit: 4, default: 0, null: false
  end

  create_table "wlje4_content_rating", primary_key: "content_id", force: :cascade do |t|
    t.integer "rating_sum",   limit: 4,  default: 0,  null: false
    t.integer "rating_count", limit: 4,  default: 0,  null: false
    t.string  "lastip",       limit: 50, default: "", null: false
  end

  create_table "wlje4_content_types", primary_key: "type_id", force: :cascade do |t|
    t.string "type_title",              limit: 255,   default: "", null: false
    t.string "type_alias",              limit: 255,   default: "", null: false
    t.string "table",                   limit: 255,   default: "", null: false
    t.text   "rules",                   limit: 65535,              null: false
    t.text   "field_mappings",          limit: 65535,              null: false
    t.string "router",                  limit: 255,   default: "", null: false
    t.string "content_history_options", limit: 5120
  end

  add_index "wlje4_content_types", ["type_alias"], name: "idx_alias", using: :btree

  create_table "wlje4_contentbuilder_articles", force: :cascade do |t|
    t.integer  "article_id",   limit: 4,  default: 0,  null: false
    t.string   "type",         limit: 55, default: "", null: false
    t.integer  "reference_id", limit: 4,  default: 0,  null: false
    t.integer  "record_id",    limit: 8,  default: 0,  null: false
    t.integer  "form_id",      limit: 4,  default: 0,  null: false
    t.datetime "last_update",                          null: false
  end

  add_index "wlje4_contentbuilder_articles", ["article_id", "record_id"], name: "article_id", using: :btree
  add_index "wlje4_contentbuilder_articles", ["record_id", "form_id"], name: "record_id", using: :btree
  add_index "wlje4_contentbuilder_articles", ["record_id"], name: "record_id_2", using: :btree
  add_index "wlje4_contentbuilder_articles", ["type"], name: "type", using: :btree

  create_table "wlje4_contentbuilder_elements", force: :cascade do |t|
    t.integer "form_id",                  limit: 4,     default: 0,     null: false
    t.integer "reference_id",             limit: 4,     default: 0,     null: false
    t.string  "type",                     limit: 255,   default: "",    null: false
    t.string  "change_type",              limit: 255,   default: "",    null: false
    t.text    "options",                  limit: 65535,                 null: false
    t.text    "custom_init_script",       limit: 65535,                 null: false
    t.text    "custom_action_script",     limit: 65535,                 null: false
    t.text    "custom_validation_script", limit: 65535,                 null: false
    t.text    "validation_message",       limit: 65535,                 null: false
    t.text    "default_value",            limit: 65535,                 null: false
    t.text    "hint",                     limit: 65535,                 null: false
    t.string  "label",                    limit: 255,   default: "",    null: false
    t.boolean "list_include",                           default: false, null: false
    t.boolean "search_include",                         default: true,  null: false
    t.text    "item_wrapper",             limit: 65535,                 null: false
    t.integer "wordwrap",                 limit: 4,     default: 0,     null: false
    t.boolean "linkable",                               default: true,  null: false
    t.boolean "editable",                               default: false, null: false
    t.text    "validations",              limit: 65535,                 null: false
    t.boolean "published",                              default: true,  null: false
    t.string  "order_type",               limit: 255,   default: "",    null: false
    t.integer "ordering",                 limit: 4,     default: 0,     null: false
  end

  add_index "wlje4_contentbuilder_elements", ["form_id", "reference_id"], name: "form_id", using: :btree
  add_index "wlje4_contentbuilder_elements", ["reference_id"], name: "reference_id", using: :btree

  create_table "wlje4_contentbuilder_forms", force: :cascade do |t|
    t.string   "type",                                  limit: 255,        default: "",     null: false
    t.integer  "reference_id",                          limit: 4,          default: 0,      null: false
    t.string   "name",                                  limit: 255,        default: "",     null: false
    t.string   "tag",                                   limit: 255,        default: "",     null: false
    t.string   "title",                                 limit: 255,        default: "",     null: false
    t.text     "details_template",                      limit: 4294967295,                  null: false
    t.text     "details_prepare",                       limit: 4294967295,                  null: false
    t.text     "editable_template",                     limit: 4294967295,                  null: false
    t.text     "editable_prepare",                      limit: 4294967295,                  null: false
    t.datetime "created",                                                                   null: false
    t.datetime "modified",                                                                  null: false
    t.string   "created_by",                            limit: 255,        default: "",     null: false
    t.string   "modified_by",                           limit: 255,        default: "",     null: false
    t.boolean  "metadata",                                                 default: true,   null: false
    t.boolean  "export_xls",                                               default: false,  null: false
    t.boolean  "print_button",                                             default: true,   null: false
    t.boolean  "show_id_column",                                           default: false,  null: false
    t.boolean  "use_view_name_as_title",                                   default: false,  null: false
    t.boolean  "display_in",                                               default: false,  null: false
    t.boolean  "edit_button",                                              default: false,  null: false
    t.boolean  "list_state",                                               default: false,  null: false
    t.boolean  "list_publish",                                             default: false,  null: false
    t.boolean  "list_language",                                            default: false,  null: false
    t.boolean  "list_article",                                             default: false,  null: false
    t.boolean  "list_author",                                              default: false,  null: false
    t.boolean  "select_column",                                            default: false,  null: false
    t.boolean  "published_only",                                           default: false,  null: false
    t.boolean  "own_only",                                                 default: false,  null: false
    t.boolean  "own_only_fe",                                              default: false,  null: false
    t.integer  "ordering",                              limit: 4,          default: 0,      null: false
    t.text     "intro_text",                            limit: 65535,                       null: false
    t.text     "config",                                limit: 4294967295,                  null: false
    t.integer  "default_section",                       limit: 4,          default: 0,      null: false
    t.integer  "default_category",                      limit: 4,          default: 0,      null: false
    t.string   "default_lang_code",                     limit: 7,          default: "*",    null: false
    t.boolean  "default_lang_code_ignore",                                 default: false,  null: false
    t.boolean  "create_articles",                                          default: true,   null: false
    t.boolean  "published",                                                default: false,  null: false
    t.string   "initial_sort_order",                    limit: 255,        default: "-1",   null: false
    t.string   "initial_sort_order2",                   limit: 255,        default: "-1",   null: false
    t.string   "initial_sort_order3",                   limit: 255,        default: "-1",   null: false
    t.string   "initial_order_dir",                     limit: 4,          default: "desc", null: false
    t.integer  "title_field",                           limit: 4,          default: 0,      null: false
    t.boolean  "delete_articles",                                          default: true,   null: false
    t.boolean  "edit_by_type",                                             default: false,  null: false
    t.boolean  "email_notifications",                                      default: true,   null: false
    t.boolean  "email_update_notifications",                               default: false,  null: false
    t.boolean  "limited_article_options",                                  default: true,   null: false
    t.boolean  "limited_article_options_fe",                               default: true,   null: false
    t.text     "upload_directory",                      limit: 65535,                       null: false
    t.boolean  "protect_upload_directory",                                 default: true,   null: false
    t.datetime "last_update",                                                               null: false
    t.integer  "limit_add",                             limit: 4,          default: 0,      null: false
    t.integer  "limit_edit",                            limit: 4,          default: 0,      null: false
    t.boolean  "verification_required_view",                               default: false,  null: false
    t.float    "verification_days_view",                limit: 24,         default: 0.0,    null: false
    t.boolean  "verification_required_new",                                default: false,  null: false
    t.float    "verification_days_new",                 limit: 24,         default: 0.0,    null: false
    t.boolean  "verification_required_edit",                               default: false,  null: false
    t.float    "verification_days_edit",                limit: 24,         default: 0.0,    null: false
    t.text     "verification_url_view",                 limit: 65535,                       null: false
    t.text     "verification_url_new",                  limit: 65535,                       null: false
    t.text     "verification_url_edit",                 limit: 65535,                       null: false
    t.boolean  "show_all_languages_fe",                                    default: true,   null: false
    t.integer  "default_publish_up_days",               limit: 4,          default: 0,      null: false
    t.integer  "default_publish_down_days",             limit: 4,          default: 0,      null: false
    t.integer  "default_access",                        limit: 4,          default: 0,      null: false
    t.boolean  "default_featured",                                         default: false,  null: false
    t.text     "email_admin_template",                  limit: 65535,                       null: false
    t.string   "email_admin_subject",                   limit: 255,        default: "",     null: false
    t.string   "email_admin_alternative_from",          limit: 255,        default: "",     null: false
    t.string   "email_admin_alternative_fromname",      limit: 255,        default: "",     null: false
    t.text     "email_admin_recipients",                limit: 65535,                       null: false
    t.text     "email_admin_recipients_attach_uploads", limit: 65535,                       null: false
    t.boolean  "email_admin_html",                                         default: false,  null: false
    t.text     "email_template",                        limit: 65535,                       null: false
    t.string   "email_subject",                         limit: 255,        default: "",     null: false
    t.string   "email_alternative_from",                limit: 255,        default: "",     null: false
    t.string   "email_alternative_fromname",            limit: 255,                         null: false
    t.text     "email_recipients",                      limit: 65535,                       null: false
    t.text     "email_recipients_attach_uploads",       limit: 65535,                       null: false
    t.boolean  "email_html",                                               default: false,  null: false
    t.boolean  "act_as_registration",                                      default: false,  null: false
    t.string   "registration_username_field",           limit: 255,        default: "",     null: false
    t.string   "registration_password_field",           limit: 255,        default: "",     null: false
    t.string   "registration_password_repeat_field",    limit: 255,        default: "",     null: false
    t.string   "registration_name_field",               limit: 255,        default: "",     null: false
    t.string   "registration_email_field",              limit: 255,        default: "",     null: false
    t.string   "registration_email_repeat_field",       limit: 255,        default: "",     null: false
    t.boolean  "auto_publish",                                             default: false,  null: false
    t.boolean  "force_login",                                              default: false,  null: false
    t.text     "force_url",                             limit: 65535,                       null: false
    t.string   "registration_bypass_plugin",            limit: 255,        default: "",     null: false
    t.text     "registration_bypass_plugin_params",     limit: 65535,                       null: false
    t.string   "registration_bypass_verification_name", limit: 255,        default: "",     null: false
    t.string   "registration_bypass_verify_view",       limit: 32,         default: "",     null: false
    t.string   "theme_plugin",                          limit: 255,        default: "",     null: false
    t.boolean  "list_rating",                                              default: false,  null: false
    t.boolean  "rating_slots",                                             default: false,  null: false
    t.datetime "rand_date_update",                                                          null: false
    t.integer  "rand_update",                           limit: 4,          default: 86400,  null: false
    t.boolean  "article_record_impact_publish",                            default: false,  null: false
    t.boolean  "article_record_impact_language",                           default: false,  null: false
    t.boolean  "allow_external_filter",                                    default: false,  null: false
    t.boolean  "show_filter",                                              default: true,   null: false
    t.boolean  "show_records_per_page",                                    default: true,   null: false
    t.integer  "initial_list_limit",                    limit: 1,          default: 20,     null: false
    t.string   "save_button_title",                     limit: 255,        default: "",     null: false
    t.boolean  "filter_exact_match",                                       default: false,  null: false
    t.string   "apply_button_title",                    limit: 255,        default: "",     null: false
  end

  add_index "wlje4_contentbuilder_forms", ["rand_date_update"], name: "rand_date_update", using: :btree
  add_index "wlje4_contentbuilder_forms", ["reference_id"], name: "reference_id", using: :btree
  add_index "wlje4_contentbuilder_forms", ["tag"], name: "tag", using: :btree

  create_table "wlje4_contentbuilder_list_records", force: :cascade do |t|
    t.integer "form_id",      limit: 4, default: 0,     null: false
    t.integer "record_id",    limit: 8, default: 0,     null: false
    t.integer "state_id",     limit: 4, default: 0,     null: false
    t.integer "reference_id", limit: 4, default: 0,     null: false
    t.boolean "published",              default: false, null: false
  end

  add_index "wlje4_contentbuilder_list_records", ["form_id", "record_id", "state_id"], name: "form_id", using: :btree

  create_table "wlje4_contentbuilder_list_states", force: :cascade do |t|
    t.integer "form_id",   limit: 4,   default: 0,  null: false
    t.string  "title",     limit: 255, default: "", null: false
    t.string  "color",     limit: 255, default: "", null: false
    t.string  "action",    limit: 255, default: "", null: false
    t.integer "published", limit: 1,   default: 0,  null: false
  end

  create_table "wlje4_contentbuilder_rating_cache", id: false, force: :cascade do |t|
    t.string   "record_id", limit: 255, default: "", null: false
    t.integer  "form_id",   limit: 4,   default: 0,  null: false
    t.string   "ip",        limit: 50,  default: "", null: false
    t.datetime "date",                               null: false
  end

  add_index "wlje4_contentbuilder_rating_cache", ["date"], name: "date", using: :btree
  add_index "wlje4_contentbuilder_rating_cache", ["record_id", "form_id", "ip"], name: "record_id", using: :btree

  create_table "wlje4_contentbuilder_records", force: :cascade do |t|
    t.string   "type",         limit: 255,   default: "",    null: false
    t.integer  "record_id",    limit: 8,     default: 0,     null: false
    t.integer  "reference_id", limit: 4,     default: 0,     null: false
    t.integer  "edited",       limit: 4,     default: 0,     null: false
    t.string   "sef",          limit: 50,    default: "",    null: false
    t.string   "lang_code",    limit: 7,     default: "*",   null: false
    t.datetime "publish_up",                                 null: false
    t.datetime "publish_down",                               null: false
    t.datetime "last_update",                                null: false
    t.boolean  "is_future",                  default: false, null: false
    t.integer  "rating_sum",   limit: 4,     default: 0,     null: false
    t.integer  "rating_count", limit: 4,     default: 0,     null: false
    t.string   "lastip",       limit: 50,    default: "",    null: false
    t.string   "session_id",   limit: 32,    default: "",    null: false
    t.boolean  "published",                  default: false, null: false
    t.datetime "rand_date",                                  null: false
    t.text     "metakey",      limit: 65535,                 null: false
    t.text     "metadesc",     limit: 65535,                 null: false
    t.string   "robots",       limit: 255,   default: "",    null: false
    t.string   "author",       limit: 255,   default: "",    null: false
    t.string   "rights",       limit: 255,   default: "",    null: false
    t.string   "xreference",   limit: 255,   default: "",    null: false
  end

  add_index "wlje4_contentbuilder_records", ["rand_date"], name: "rand_date", using: :btree
  add_index "wlje4_contentbuilder_records", ["record_id"], name: "record_id", using: :btree
  add_index "wlje4_contentbuilder_records", ["reference_id"], name: "reference_id", using: :btree

  create_table "wlje4_contentbuilder_registered_users", force: :cascade do |t|
    t.integer "user_id",   limit: 4, default: 0, null: false
    t.integer "record_id", limit: 8, default: 0, null: false
    t.integer "form_id",   limit: 4,             null: false
  end

  add_index "wlje4_contentbuilder_registered_users", ["user_id", "record_id", "form_id"], name: "user_id", using: :btree

  create_table "wlje4_contentbuilder_resource_access", id: false, force: :cascade do |t|
    t.string  "type",        limit: 100, default: "", null: false
    t.integer "form_id",     limit: 4,   default: 0,  null: false
    t.integer "element_id",  limit: 4,   default: 0,  null: false
    t.string  "resource_id", limit: 100,              null: false
    t.integer "hits",        limit: 4,   default: 0,  null: false
  end

  add_index "wlje4_contentbuilder_resource_access", ["type", "element_id", "resource_id"], name: "type", unique: true, using: :btree

  create_table "wlje4_contentbuilder_storage_fields", force: :cascade do |t|
    t.integer "storage_id",       limit: 4,     default: 0,     null: false
    t.string  "name",             limit: 255,   default: "",    null: false
    t.string  "title",            limit: 255,   default: "",    null: false
    t.boolean "is_group",                       default: false, null: false
    t.text    "group_definition", limit: 65535,                 null: false
    t.integer "ordering",         limit: 4,     default: 0,     null: false
    t.boolean "published",                      default: true,  null: false
  end

  add_index "wlje4_contentbuilder_storage_fields", ["storage_id", "name"], name: "storage_id", unique: true, using: :btree

  create_table "wlje4_contentbuilder_storages", force: :cascade do |t|
    t.string  "name",      limit: 255, default: "",    null: false
    t.string  "title",     limit: 255, default: "",    null: false
    t.boolean "bytable",               default: false, null: false
    t.integer "ordering",  limit: 4,   default: 0,     null: false
    t.boolean "published",             default: false, null: false
  end

  add_index "wlje4_contentbuilder_storages", ["name"], name: "name", unique: true, using: :btree

  create_table "wlje4_contentbuilder_users", force: :cascade do |t|
    t.integer  "userid",                 limit: 4, default: 0,     null: false
    t.integer  "form_id",                limit: 4, default: 0,     null: false
    t.integer  "records",                limit: 4, default: 0,     null: false
    t.boolean  "verified_view",                    default: false, null: false
    t.datetime "verification_date_view",                           null: false
    t.boolean  "verified_new",                     default: false, null: false
    t.datetime "verification_date_new",                            null: false
    t.boolean  "verified_edit",                    default: false, null: false
    t.datetime "verification_date_edit",                           null: false
    t.integer  "limit_add",              limit: 4, default: 0,     null: false
    t.integer  "limit_edit",             limit: 4, default: 0,     null: false
    t.boolean  "published",                        default: true,  null: false
  end

  add_index "wlje4_contentbuilder_users", ["userid", "form_id"], name: "userid", unique: true, using: :btree

  create_table "wlje4_contentbuilder_verifications", force: :cascade do |t|
    t.string   "verification_hash", limit: 255,   default: "",    null: false
    t.datetime "start_date",                                      null: false
    t.datetime "verification_date",                               null: false
    t.text     "verification_data", limit: 65535,                 null: false
    t.boolean  "create_invoice",                  default: false, null: false
    t.integer  "user_id",           limit: 4,     default: 0,     null: false
    t.string   "plugin",            limit: 255,   default: "",    null: false
    t.string   "ip",                limit: 255,   default: "",    null: false
    t.boolean  "is_test",                         default: false, null: false
    t.text     "setup",             limit: 65535,                 null: false
    t.boolean  "client",                          default: false, null: false
  end

  add_index "wlje4_contentbuilder_verifications", ["user_id"], name: "user_id", using: :btree
  add_index "wlje4_contentbuilder_verifications", ["verification_hash"], name: "verification_hash", using: :btree

  create_table "wlje4_contentitem_tag_map", id: false, force: :cascade do |t|
    t.string   "type_alias",      limit: 255, default: "", null: false
    t.integer  "core_content_id", limit: 4,                null: false
    t.integer  "content_item_id", limit: 4,                null: false
    t.integer  "tag_id",          limit: 4,                null: false
    t.datetime "tag_date",                                 null: false
    t.integer  "type_id",         limit: 3,                null: false
  end

  add_index "wlje4_contentitem_tag_map", ["core_content_id"], name: "idx_core_content_id", using: :btree
  add_index "wlje4_contentitem_tag_map", ["tag_date", "tag_id"], name: "idx_date_id", using: :btree
  add_index "wlje4_contentitem_tag_map", ["tag_id", "type_id"], name: "idx_tag_type", using: :btree
  add_index "wlje4_contentitem_tag_map", ["tag_id"], name: "idx_tag", using: :btree
  add_index "wlje4_contentitem_tag_map", ["type_id", "content_item_id", "tag_id"], name: "uc_ItemnameTagid", unique: true, using: :btree
  add_index "wlje4_contentitem_tag_map", ["type_id"], name: "idx_type", using: :btree

  create_table "wlje4_core_log_searches", id: false, force: :cascade do |t|
    t.string  "search_term", limit: 128, default: "", null: false
    t.integer "hits",        limit: 4,   default: 0,  null: false
  end

  create_table "wlje4_discuss_acl", force: :cascade do |t|
    t.string  "action",      limit: 255,                   null: false
    t.boolean "default",                   default: true,  null: false
    t.text    "description", limit: 65535,                 null: false
    t.boolean "published",                 default: true,  null: false
    t.boolean "ordering",                  default: false, null: false
    t.boolean "public",                    default: false
  end

  add_index "wlje4_discuss_acl", ["action"], name: "discuss_post_acl_action", using: :btree

  create_table "wlje4_discuss_acl_group", force: :cascade do |t|
    t.integer "content_id", limit: 8,   null: false
    t.integer "acl_id",     limit: 8,   null: false
    t.boolean "status",                 null: false
    t.string  "type",       limit: 255, null: false
  end

  add_index "wlje4_discuss_acl_group", ["acl_id"], name: "discuss_post_acl", using: :btree
  add_index "wlje4_discuss_acl_group", ["content_id", "type"], name: "discuss_post_acl_content_type", using: :btree

  create_table "wlje4_discuss_assignment_map", force: :cascade do |t|
    t.integer  "post_id",     limit: 8,     null: false
    t.integer  "assignee_id", limit: 8,     null: false
    t.integer  "assigner_id", limit: 8,     null: false
    t.datetime "created",                   null: false
    t.text     "description", limit: 65535, null: false
  end

  add_index "wlje4_discuss_assignment_map", ["post_id"], name: "post_id", using: :btree

  create_table "wlje4_discuss_attachments", force: :cascade do |t|
    t.integer  "uid",       limit: 4,     null: false
    t.text     "title",     limit: 65535, null: false
    t.string   "type",      limit: 200,   null: false
    t.text     "path",      limit: 65535, null: false
    t.datetime "created",                 null: false
    t.integer  "published", limit: 1,     null: false
    t.text     "mime",      limit: 65535, null: false
    t.text     "size",      limit: 65535, null: false
  end

  add_index "wlje4_discuss_attachments", ["type"], name: "type", using: :btree
  add_index "wlje4_discuss_attachments", ["uid"], name: "uid", using: :btree

  create_table "wlje4_discuss_badges", force: :cascade do |t|
    t.integer  "rule_id",     limit: 8,     null: false
    t.text     "title",       limit: 65535, null: false
    t.string   "alias",       limit: 255,   null: false
    t.text     "description", limit: 65535, null: false
    t.text     "avatar",      limit: 65535, null: false
    t.datetime "created",                   null: false
    t.integer  "published",   limit: 1,     null: false
    t.integer  "rule_limit",  limit: 8,     null: false
  end

  add_index "wlje4_discuss_badges", ["alias"], name: "discuss_badges_alias", using: :btree
  add_index "wlje4_discuss_badges", ["published"], name: "discuss_badges_published", using: :btree

  create_table "wlje4_discuss_badges_history", force: :cascade do |t|
    t.integer  "user_id", limit: 8,     null: false
    t.text     "title",   limit: 65535, null: false
    t.text     "command", limit: 65535, null: false
    t.datetime "created",               null: false
  end

  add_index "wlje4_discuss_badges_history", ["user_id"], name: "user_id", using: :btree

  create_table "wlje4_discuss_badges_rules", force: :cascade do |t|
    t.text     "command",     limit: 65535, null: false
    t.text     "title",       limit: 65535, null: false
    t.text     "description", limit: 65535, null: false
    t.text     "callback",    limit: 65535, null: false
    t.datetime "created",                   null: false
    t.integer  "published",   limit: 1,     null: false
  end

  create_table "wlje4_discuss_badges_users", force: :cascade do |t|
    t.integer  "badge_id",  limit: 8,     null: false
    t.integer  "user_id",   limit: 8,     null: false
    t.datetime "created",                 null: false
    t.integer  "published", limit: 1,     null: false
    t.text     "custom",    limit: 65535, null: false
  end

  add_index "wlje4_discuss_badges_users", ["badge_id", "user_id"], name: "badge_id", using: :btree

  create_table "wlje4_discuss_captcha", force: :cascade do |t|
    t.string   "response", limit: 5, null: false
    t.datetime "created",            null: false
  end

  create_table "wlje4_discuss_category", force: :cascade do |t|
    t.integer  "created_by",  limit: 4,                     null: false
    t.string   "title",       limit: 255,                   null: false
    t.text     "description", limit: 65535,                 null: false
    t.string   "alias",       limit: 255
    t.datetime "created",                                   null: false
    t.boolean  "status",                    default: false, null: false
    t.boolean  "published",                 default: false, null: false
    t.boolean  "ordering",                  default: false, null: false
    t.string   "avatar",      limit: 255
    t.integer  "parent_id",   limit: 4,     default: 0
    t.integer  "private",     limit: 4,     default: 0,     null: false
    t.boolean  "default",                   default: false, null: false
    t.integer  "level",       limit: 4
    t.integer  "lft",         limit: 4
    t.integer  "rgt",         limit: 4
    t.text     "params",      limit: 65535,                 null: false
    t.integer  "container",   limit: 1,     default: 0,     null: false
  end

  add_index "wlje4_discuss_category", ["parent_id", "published", "ordering"], name: "discuss_cat_acl", using: :btree
  add_index "wlje4_discuss_category", ["parent_id"], name: "discuss_cat_parentid", using: :btree
  add_index "wlje4_discuss_category", ["published", "private", "id"], name: "discuss_cat_mod_categories1", using: :btree
  add_index "wlje4_discuss_category", ["published", "private", "ordering"], name: "discuss_cat_mod_categories2", using: :btree
  add_index "wlje4_discuss_category", ["published"], name: "discuss_cat_published", using: :btree

  create_table "wlje4_discuss_category_acl_item", force: :cascade do |t|
    t.string  "action",      limit: 255,                   null: false
    t.text    "description", limit: 65535
    t.boolean "published",                 default: false, null: false
    t.boolean "default",                   default: true
  end

  create_table "wlje4_discuss_category_acl_map", force: :cascade do |t|
    t.integer "category_id", limit: 8,                  null: false
    t.integer "acl_id",      limit: 8,                  null: false
    t.string  "type",        limit: 25,                 null: false
    t.integer "content_id",  limit: 8,                  null: false
    t.boolean "status",                 default: false
  end

  add_index "wlje4_discuss_category_acl_map", ["acl_id"], name: "discuss_category_acl_id", using: :btree
  add_index "wlje4_discuss_category_acl_map", ["category_id", "content_id", "type"], name: "discuss_category_content_type", using: :btree
  add_index "wlje4_discuss_category_acl_map", ["category_id"], name: "discuss_category_acl", using: :btree
  add_index "wlje4_discuss_category_acl_map", ["content_id", "type"], name: "discuss_content_type", using: :btree

  create_table "wlje4_discuss_comments", force: :cascade do |t|
    t.text     "comment",   limit: 65535
    t.string   "name",      limit: 255,                   null: false
    t.string   "title",     limit: 255,                   null: false
    t.string   "email",     limit: 255,   default: ""
    t.string   "url",       limit: 255,   default: ""
    t.string   "ip",        limit: 255,   default: ""
    t.datetime "created",                                 null: false
    t.datetime "modified"
    t.boolean  "published",               default: false
    t.boolean  "ordering",                default: false
    t.integer  "post_id",   limit: 8
    t.integer  "user_id",   limit: 4,     default: 0
    t.integer  "parent_id", limit: 4,     default: 0,     null: false
    t.boolean  "sent",                    default: false, null: false
    t.integer  "lft",       limit: 4,     default: 0,     null: false
    t.integer  "rgt",       limit: 4,     default: 0,     null: false
  end

  add_index "wlje4_discuss_comments", ["post_id", "created"], name: "discuss_comment_post_created", using: :btree
  add_index "wlje4_discuss_comments", ["post_id"], name: "discuss_comment_postid", using: :btree

  create_table "wlje4_discuss_configs", force: :cascade do |t|
    t.string "name",   limit: 100
    t.text   "params", limit: 65535
  end

  create_table "wlje4_discuss_conversations", force: :cascade do |t|
    t.datetime "created",               null: false
    t.integer  "created_by",  limit: 8, null: false
    t.datetime "lastreplied",           null: false
  end

  create_table "wlje4_discuss_conversations_message", force: :cascade do |t|
    t.integer  "conversation_id", limit: 8,     null: false
    t.text     "message",         limit: 65535
    t.datetime "created",                       null: false
    t.integer  "created_by",      limit: 8,     null: false
  end

  add_index "wlje4_discuss_conversations_message", ["conversation_id"], name: "conversation_id", using: :btree
  add_index "wlje4_discuss_conversations_message", ["created_by"], name: "created_by", using: :btree

  create_table "wlje4_discuss_conversations_message_maps", force: :cascade do |t|
    t.integer "user_id",         limit: 8,                 null: false
    t.integer "conversation_id", limit: 8,                 null: false
    t.integer "message_id",      limit: 8,                 null: false
    t.boolean "isread",                    default: false, null: false
    t.integer "state",           limit: 1,                 null: false
  end

  add_index "wlje4_discuss_conversations_message_maps", ["conversation_id"], name: "conversation_id", using: :btree
  add_index "wlje4_discuss_conversations_message_maps", ["message_id"], name: "message_id", using: :btree
  add_index "wlje4_discuss_conversations_message_maps", ["user_id"], name: "node_id", using: :btree

  create_table "wlje4_discuss_conversations_participants", force: :cascade do |t|
    t.integer "conversation_id", limit: 8, null: false
    t.integer "user_id",         limit: 8, null: false
  end

  add_index "wlje4_discuss_conversations_participants", ["conversation_id"], name: "conversation_id", using: :btree

  create_table "wlje4_discuss_customfields", force: :cascade do |t|
    t.string  "type",      limit: 100,                   null: false
    t.string  "title",     limit: 255,                   null: false
    t.text    "params",    limit: 65535
    t.integer "ordering",  limit: 8,     default: 0,     null: false
    t.boolean "published",               default: false, null: false
  end

  create_table "wlje4_discuss_customfields_acl", force: :cascade do |t|
    t.string  "action",        limit: 255,                  null: false
    t.text    "description",   limit: 65535,                null: false
    t.boolean "acl_published",                              null: false
    t.boolean "default",                     default: true
  end

  create_table "wlje4_discuss_customfields_rule", force: :cascade do |t|
    t.integer "field_id",     limit: 8,                  null: false
    t.integer "acl_id",       limit: 8,                  null: false
    t.integer "content_id",   limit: 4,                  null: false
    t.string  "content_type", limit: 25,                 null: false
    t.boolean "status",                  default: false
  end

  add_index "wlje4_discuss_customfields_rule", ["content_type", "acl_id", "content_id"], name: "cf_rule_acl_types", using: :btree
  add_index "wlje4_discuss_customfields_rule", ["field_id"], name: "cf_rule_field_id", using: :btree

  create_table "wlje4_discuss_customfields_value", force: :cascade do |t|
    t.integer "field_id", limit: 8,     null: false
    t.text    "value",    limit: 65535, null: false
    t.integer "post_id",  limit: 8,     null: false
  end

  add_index "wlje4_discuss_customfields_value", ["field_id", "post_id"], name: "cf_value_field_post", using: :btree
  add_index "wlje4_discuss_customfields_value", ["field_id"], name: "cf_value_field_id", using: :btree

  create_table "wlje4_discuss_favourites", force: :cascade do |t|
    t.integer  "created_by", limit: 8,  null: false
    t.integer  "post_id",    limit: 8,  null: false
    t.string   "type",       limit: 20, null: false
    t.datetime "created",               null: false
  end

  add_index "wlje4_discuss_favourites", ["post_id"], name: "idx_fav_postid", using: :btree

  create_table "wlje4_discuss_hashkeys", force: :cascade do |t|
    t.integer "uid",  limit: 8,     null: false
    t.string  "type", limit: 255,   null: false
    t.text    "key",  limit: 65535, null: false
  end

  add_index "wlje4_discuss_hashkeys", ["type"], name: "type", using: :btree
  add_index "wlje4_discuss_hashkeys", ["uid"], name: "uid", using: :btree

  create_table "wlje4_discuss_likes", force: :cascade do |t|
    t.string   "type",       limit: 20,             null: false
    t.integer  "content_id", limit: 4,              null: false
    t.integer  "created_by", limit: 8,  default: 0
    t.datetime "created",                           null: false
  end

  add_index "wlje4_discuss_likes", ["content_id"], name: "discuss_contentid", using: :btree
  add_index "wlje4_discuss_likes", ["created_by"], name: "discuss_createdby", using: :btree
  add_index "wlje4_discuss_likes", ["type", "content_id"], name: "discuss_content_type", using: :btree

  create_table "wlje4_discuss_mailq", force: :cascade do |t|
    t.string   "mailfrom",  limit: 255
    t.string   "fromname",  limit: 255
    t.string   "recipient", limit: 255,                   null: false
    t.text     "subject",   limit: 65535,                 null: false
    t.text     "body",      limit: 65535,                 null: false
    t.datetime "created",                                 null: false
    t.boolean  "status",                  default: false, null: false
    t.boolean  "ashtml",                                  null: false
  end

  add_index "wlje4_discuss_mailq", ["status"], name: "discuss_mailq_status", using: :btree

  create_table "wlje4_discuss_migrators", force: :cascade do |t|
    t.integer "internal_id", limit: 8,     null: false
    t.integer "external_id", limit: 8,     null: false
    t.text    "component",   limit: 65535, null: false
    t.text    "type",        limit: 65535, null: false
  end

  add_index "wlje4_discuss_migrators", ["external_id"], name: "idx_external_id", using: :btree

  create_table "wlje4_discuss_notifications", force: :cascade do |t|
    t.text     "title",     limit: 65535, null: false
    t.integer  "cid",       limit: 8,     null: false
    t.string   "type",      limit: 255,   null: false
    t.datetime "created",                 null: false
    t.integer  "target",    limit: 8,     null: false
    t.integer  "author",    limit: 8,     null: false
    t.text     "permalink", limit: 65535, null: false
    t.integer  "state",     limit: 1,     null: false
    t.text     "favicon",   limit: 65535, null: false
    t.string   "component", limit: 255,   null: false
  end

  add_index "wlje4_discuss_notifications", ["created"], name: "discuss_notification_created", using: :btree
  add_index "wlje4_discuss_notifications", ["target", "state", "cid", "created", "id"], name: "discuss_notification", using: :btree

  create_table "wlje4_discuss_oauth", force: :cascade do |t|
    t.string "type",          limit: 255,   null: false
    t.text   "request_token", limit: 65535, null: false
    t.text   "access_token",  limit: 65535, null: false
    t.text   "message",       limit: 65535, null: false
    t.text   "params",        limit: 65535, null: false
  end

  add_index "wlje4_discuss_oauth", ["type"], name: "discuss_oauth_type", using: :btree

  create_table "wlje4_discuss_oauth_posts", force: :cascade do |t|
    t.integer "post_id",  limit: 8, null: false
    t.integer "oauth_id", limit: 8, null: false
  end

  create_table "wlje4_discuss_points", force: :cascade do |t|
    t.integer  "rule_id",    limit: 8,     null: false
    t.text     "title",      limit: 65535, null: false
    t.datetime "created",                  null: false
    t.integer  "published",  limit: 1,     null: false
    t.integer  "rule_limit", limit: 8,     null: false
  end

  add_index "wlje4_discuss_points", ["published"], name: "discuss_points_published", using: :btree
  add_index "wlje4_discuss_points", ["rule_id"], name: "discuss_points_rule", using: :btree

  create_table "wlje4_discuss_polls", force: :cascade do |t|
    t.integer "post_id",        limit: 8,                 null: false
    t.text    "value",          limit: 65535,             null: false
    t.integer "count",          limit: 8,     default: 0, null: false
    t.boolean "multiple_polls"
  end

  add_index "wlje4_discuss_polls", ["post_id", "id"], name: "polls_posts", using: :btree
  add_index "wlje4_discuss_polls", ["post_id"], name: "post_id", using: :btree

  create_table "wlje4_discuss_polls_question", force: :cascade do |t|
    t.integer "post_id",  limit: 8,                     null: false
    t.text    "title",    limit: 65535,                 null: false
    t.boolean "multiple",               default: false
    t.boolean "locked",                 default: false
  end

  add_index "wlje4_discuss_polls_question", ["post_id"], name: "post_id", using: :btree

  create_table "wlje4_discuss_polls_users", force: :cascade do |t|
    t.integer "poll_id",    limit: 8,   null: false
    t.integer "user_id",    limit: 8,   null: false
    t.string  "session_id", limit: 200
  end

  add_index "wlje4_discuss_polls_users", ["poll_id", "user_id"], name: "poll_id", using: :btree

  create_table "wlje4_discuss_post_types", force: :cascade do |t|
    t.string   "title",     limit: 255, null: false
    t.string   "suffix",    limit: 50,  null: false
    t.datetime "created",               null: false
    t.integer  "published", limit: 1,   null: false
    t.string   "alias",     limit: 255, null: false
  end

  add_index "wlje4_discuss_post_types", ["alias"], name: "idx_alias", using: :btree

  create_table "wlje4_discuss_posts", force: :cascade do |t|
    t.text     "title",         limit: 65535
    t.text     "alias",         limit: 65535,                      null: false
    t.datetime "created",                                          null: false
    t.datetime "modified"
    t.datetime "replied",                                          null: false
    t.text     "content",       limit: 4294967295,                 null: false
    t.boolean  "published",                        default: false, null: false
    t.boolean  "ordering",                         default: false, null: false
    t.integer  "vote",          limit: 4,          default: 0
    t.integer  "hits",          limit: 4,          default: 0
    t.boolean  "islock",                           default: false
    t.datetime "lockdate",                                         null: false
    t.boolean  "featured",                         default: false
    t.boolean  "isresolve",                        default: false
    t.boolean  "isreport",                         default: false
    t.boolean  "answered",                         default: false
    t.integer  "user_id",       limit: 8,          default: 0
    t.integer  "parent_id",     limit: 8,          default: 0
    t.string   "user_type",     limit: 255,                        null: false
    t.string   "poster_name",   limit: 255,                        null: false
    t.string   "poster_email",  limit: 255,                        null: false
    t.integer  "num_likes",     limit: 4,          default: 0
    t.integer  "num_negvote",   limit: 4,          default: 0
    t.integer  "sum_totalvote", limit: 4,          default: 0
    t.integer  "category_id",   limit: 8,          default: 1,     null: false
    t.text     "params",        limit: 65535,                      null: false
    t.text     "password",      limit: 65535
    t.boolean  "legacy",                           default: true
    t.text     "address",       limit: 65535
    t.string   "latitude",      limit: 255,                        null: false
    t.string   "longitude",     limit: 255,                        null: false
    t.string   "content_type",  limit: 25
    t.boolean  "post_status",                      default: false, null: false
    t.string   "post_type",     limit: 255,                        null: false
    t.string   "ip",            limit: 255,                        null: false
    t.integer  "private",       limit: 1,          default: 0,     null: false
  end

  add_index "wlje4_discuss_posts", ["answered"], name: "discuss_post_answered", using: :btree
  add_index "wlje4_discuss_posts", ["category_id"], name: "discuss_post_category", using: :btree
  add_index "wlje4_discuss_posts", ["isreport"], name: "discuss_post_isreport", using: :btree
  add_index "wlje4_discuss_posts", ["parent_id", "id"], name: "discuss_post_last_reply", using: :btree
  add_index "wlje4_discuss_posts", ["post_type"], name: "idx_post_type", using: :btree
  add_index "wlje4_discuss_posts", ["private"], name: "private", using: :btree
  add_index "wlje4_discuss_posts", ["published", "parent_id", "answered", "id"], name: "discuss_post_query1", using: :btree
  add_index "wlje4_discuss_posts", ["published", "parent_id", "answered", "replied"], name: "discuss_post_query2", using: :btree
  add_index "wlje4_discuss_posts", ["published", "parent_id", "category_id", "created"], name: "discuss_post_query3", using: :btree
  add_index "wlje4_discuss_posts", ["published", "parent_id", "category_id", "id"], name: "discuss_post_query4", using: :btree
  add_index "wlje4_discuss_posts", ["published", "parent_id", "created"], name: "discuss_post_query5", using: :btree
  add_index "wlje4_discuss_posts", ["published", "parent_id", "id"], name: "discuss_post_query6", using: :btree
  add_index "wlje4_discuss_posts", ["published", "parent_id", "legacy", "category_id", "id"], name: "unread_category_posts", using: :btree
  add_index "wlje4_discuss_posts", ["published", "parent_id"], name: "discuss_post_parentid", using: :btree
  add_index "wlje4_discuss_posts", ["published"], name: "discuss_post_published", using: :btree
  add_index "wlje4_discuss_posts", ["title", "content"], name: "discuss_post_titlecontent", type: :fulltext
  add_index "wlje4_discuss_posts", ["user_id"], name: "discuss_post_user_id", using: :btree
  add_index "wlje4_discuss_posts", ["vote"], name: "discuss_post_vote", using: :btree

  create_table "wlje4_discuss_posts_labels", force: :cascade do |t|
    t.string   "title",       limit: 255,                   null: false
    t.text     "description", limit: 65535,                 null: false
    t.boolean  "published",                 default: false, null: false
    t.integer  "ordering",    limit: 8,     default: 0,     null: false
    t.integer  "creator",     limit: 8,                     null: false
    t.datetime "created",                                   null: false
  end

  create_table "wlje4_discuss_posts_labels_map", force: :cascade do |t|
    t.integer  "post_id",       limit: 8, null: false
    t.integer  "post_label_id", limit: 8, null: false
    t.integer  "creator_id",    limit: 8, null: false
    t.datetime "created",                 null: false
  end

  add_index "wlje4_discuss_posts_labels_map", ["post_id"], name: "post_id", using: :btree

  create_table "wlje4_discuss_posts_references", force: :cascade do |t|
    t.integer "post_id",      limit: 8,     null: false
    t.integer "reference_id", limit: 8,     null: false
    t.text    "extension",    limit: 65535, null: false
  end

  add_index "wlje4_discuss_posts_references", ["post_id", "reference_id"], name: "post_id", using: :btree

  create_table "wlje4_discuss_posts_tags", force: :cascade do |t|
    t.integer "post_id", limit: 8
    t.integer "tag_id",  limit: 8
  end

  add_index "wlje4_discuss_posts_tags", ["post_id", "tag_id"], name: "post_tag", unique: true, using: :btree
  add_index "wlje4_discuss_posts_tags", ["post_id"], name: "discuss_posts_tags_postid", using: :btree
  add_index "wlje4_discuss_posts_tags", ["tag_id"], name: "discuss_posts_tags_tagid", using: :btree

  create_table "wlje4_discuss_ranks", force: :cascade do |t|
    t.text    "title", limit: 65535,             null: false
    t.integer "start", limit: 8,     default: 0, null: false
    t.integer "end",   limit: 8,     default: 0, null: false
  end

  add_index "wlje4_discuss_ranks", ["start", "end"], name: "discuss_ranks_range", using: :btree

  create_table "wlje4_discuss_ranks_users", force: :cascade do |t|
    t.integer  "rank_id", limit: 8, null: false
    t.integer  "user_id", limit: 8, null: false
    t.datetime "created",           null: false
  end

  add_index "wlje4_discuss_ranks_users", ["rank_id", "user_id"], name: "ranks_users", using: :btree
  add_index "wlje4_discuss_ranks_users", ["rank_id"], name: "ranks_id", using: :btree
  add_index "wlje4_discuss_ranks_users", ["user_id"], name: "ranks_userid", using: :btree

  create_table "wlje4_discuss_reports", force: :cascade do |t|
    t.integer  "post_id",    limit: 4,                 null: false
    t.text     "reason",     limit: 65535
    t.integer  "created_by", limit: 8,     default: 0
    t.datetime "created",                              null: false
  end

  add_index "wlje4_discuss_reports", ["post_id"], name: "discuss_reports_post", using: :btree

  create_table "wlje4_discuss_roles", force: :cascade do |t|
    t.string   "title",           limit: 255,                   null: false
    t.text     "description",     limit: 65535,                 null: false
    t.integer  "usergroup_id",    limit: 4,                     null: false
    t.string   "colorcode",       limit: 255,                   null: false
    t.boolean  "published",                     default: false, null: false
    t.integer  "ordering",        limit: 8,     default: 0,     null: false
    t.datetime "created_time",                                  null: false
    t.integer  "created_user_id", limit: 4,     default: 0,     null: false
  end

  create_table "wlje4_discuss_rules", force: :cascade do |t|
    t.text     "command",     limit: 65535, null: false
    t.text     "title",       limit: 65535, null: false
    t.text     "description", limit: 65535, null: false
    t.text     "callback",    limit: 65535, null: false
    t.datetime "created",                   null: false
    t.integer  "published",   limit: 1,     null: false
  end

  add_index "wlje4_discuss_rules", ["command"], name: "discuss_rules_command", length: {"command"=>255}, using: :btree

  create_table "wlje4_discuss_subscription", force: :cascade do |t|
    t.integer  "userid",   limit: 8,                     null: false
    t.boolean  "member",               default: false,   null: false
    t.string   "type",     limit: 100, default: "daily", null: false
    t.integer  "cid",      limit: 8,                     null: false
    t.string   "email",    limit: 100,                   null: false
    t.string   "fullname", limit: 255,                   null: false
    t.string   "interval", limit: 100,                   null: false
    t.datetime "created",                                null: false
    t.datetime "sent_out",                               null: false
  end

  create_table "wlje4_discuss_tags", force: :cascade do |t|
    t.string   "title",     limit: 100,                 null: false
    t.string   "alias",     limit: 100,                 null: false
    t.datetime "created",                               null: false
    t.boolean  "published",             default: false
    t.integer  "user_id",   limit: 4
  end

  add_index "wlje4_discuss_tags", ["alias"], name: "discuss_tags_alias", using: :btree
  add_index "wlje4_discuss_tags", ["published", "id"], name: "discuss_tags_query1", using: :btree
  add_index "wlje4_discuss_tags", ["published"], name: "discuss_tags_published", using: :btree
  add_index "wlje4_discuss_tags", ["title"], name: "discuss_tags_title", type: :fulltext
  add_index "wlje4_discuss_tags", ["user_id"], name: "discuss_tags_user_id", using: :btree

  create_table "wlje4_discuss_users", force: :cascade do |t|
    t.string  "nickname",    limit: 255
    t.string  "avatar",      limit: 255
    t.text    "description", limit: 65535
    t.string  "url",         limit: 255
    t.text    "params",      limit: 65535
    t.string  "alias",       limit: 255
    t.integer "points",      limit: 8,     default: 0, null: false
    t.string  "latitude",    limit: 255
    t.string  "longitude",   limit: 255
    t.text    "location",    limit: 65535,             null: false
    t.text    "signature",   limit: 65535,             null: false
    t.text    "edited",      limit: 65535,             null: false
    t.text    "posts_read",  limit: 65535
    t.text    "site",        limit: 65535
  end

  add_index "wlje4_discuss_users", ["alias"], name: "discuss_users_alias", using: :btree

  create_table "wlje4_discuss_users_history", force: :cascade do |t|
    t.integer  "user_id",    limit: 8,     null: false
    t.text     "title",      limit: 65535, null: false
    t.text     "command",    limit: 65535, null: false
    t.datetime "created",                  null: false
    t.integer  "content_id", limit: 8,     null: false
  end

  add_index "wlje4_discuss_users_history", ["user_id"], name: "user_id", using: :btree

  create_table "wlje4_discuss_views", force: :cascade do |t|
    t.integer  "user_id", limit: 8,   null: false
    t.string   "hash",    limit: 255, null: false
    t.datetime "created",             null: false
    t.string   "ip",      limit: 20,  null: false
  end

  add_index "wlje4_discuss_views", ["hash"], name: "hash", using: :btree
  add_index "wlje4_discuss_views", ["user_id"], name: "user_id", unique: true, using: :btree

  create_table "wlje4_discuss_votes", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "post_id",    limit: 8
    t.datetime "created"
    t.string   "ipaddress",  limit: 15
    t.integer  "value",      limit: 1,   default: 0
    t.string   "session_id", limit: 200
  end

  add_index "wlje4_discuss_votes", ["post_id"], name: "discuss_post_id", using: :btree
  add_index "wlje4_discuss_votes", ["session_id"], name: "discuss_session_id", using: :btree
  add_index "wlje4_discuss_votes", ["user_id", "post_id"], name: "discuss_user_post", using: :btree
  add_index "wlje4_discuss_votes", ["user_id"], name: "discuss_user_id", using: :btree

  create_table "wlje4_easyblog_acl", force: :cascade do |t|
    t.string  "action",      limit: 255,                   null: false
    t.boolean "default",                   default: true,  null: false
    t.text    "description", limit: 65535,                 null: false
    t.boolean "published",                 default: true,  null: false
    t.boolean "ordering",                  default: false, null: false
  end

  add_index "wlje4_easyblog_acl", ["action"], name: "easyblog_post_acl_action", using: :btree

  create_table "wlje4_easyblog_acl_filters", id: false, force: :cascade do |t|
    t.integer "content_id",          limit: 8,     null: false
    t.text    "disallow_tags",       limit: 65535, null: false
    t.text    "disallow_attributes", limit: 65535, null: false
    t.string  "type",                limit: 255,   null: false
  end

  create_table "wlje4_easyblog_acl_group", force: :cascade do |t|
    t.integer "content_id", limit: 8,   null: false
    t.integer "acl_id",     limit: 8,   null: false
    t.boolean "status",                 null: false
    t.string  "type",       limit: 255, null: false
  end

  add_index "wlje4_easyblog_acl_group", ["acl_id", "type"], name: "acl_grp_acl_type", using: :btree
  add_index "wlje4_easyblog_acl_group", ["acl_id"], name: "easyblog_post_acl", using: :btree
  add_index "wlje4_easyblog_acl_group", ["content_id", "type"], name: "easyblog_post_acl_content_type", using: :btree

  create_table "wlje4_easyblog_adsense", force: :cascade do |t|
    t.integer "user_id",   limit: 8,                    null: false
    t.string  "code",      limit: 255,                  null: false
    t.boolean "published",             default: false,  null: false
    t.string  "display",   limit: 255, default: "both", null: false
  end

  add_index "wlje4_easyblog_adsense", ["user_id"], name: "user_id", using: :btree

  create_table "wlje4_easyblog_autoarticle_map", force: :cascade do |t|
    t.integer  "post_id",    limit: 8, null: false
    t.integer  "content_id", limit: 8, null: false
    t.datetime "created",              null: false
  end

  add_index "wlje4_easyblog_autoarticle_map", ["content_id"], name: "autoarticle_map_content_id", using: :btree
  add_index "wlje4_easyblog_autoarticle_map", ["post_id"], name: "autoarticle_map_post_id", using: :btree

  create_table "wlje4_easyblog_blogger_subscription", force: :cascade do |t|
    t.integer  "blogger_id", limit: 8,               null: false
    t.integer  "user_id",    limit: 8,   default: 0
    t.string   "fullname",   limit: 255
    t.string   "email",      limit: 100,             null: false
    t.datetime "created",                            null: false
  end

  add_index "wlje4_easyblog_blogger_subscription", ["blogger_id"], name: "easyblog_blogger_subscription_blogger_id", using: :btree
  add_index "wlje4_easyblog_blogger_subscription", ["user_id"], name: "easyblog_blogger_subscription_user_id", using: :btree

  create_table "wlje4_easyblog_captcha", force: :cascade do |t|
    t.string   "response", limit: 5, null: false
    t.datetime "created",            null: false
  end

  create_table "wlje4_easyblog_category", force: :cascade do |t|
    t.integer  "created_by",  limit: 4,                     null: false
    t.string   "title",       limit: 255,                   null: false
    t.text     "description", limit: 65535,                 null: false
    t.string   "alias",       limit: 255
    t.string   "avatar",      limit: 255
    t.integer  "parent_id",   limit: 4,     default: 0
    t.integer  "private",     limit: 4,     default: 0,     null: false
    t.datetime "created",                                   null: false
    t.boolean  "status",                    default: false, null: false
    t.boolean  "published",                 default: false, null: false
    t.boolean  "ordering",                  default: false, null: false
    t.integer  "level",       limit: 4,     default: 0
    t.integer  "lft",         limit: 4,     default: 0
    t.integer  "rgt",         limit: 4,     default: 0
    t.boolean  "default",                   default: false
  end

  add_index "wlje4_easyblog_category", ["lft"], name: "easyblog_cat_lft", using: :btree
  add_index "wlje4_easyblog_category", ["parent_id"], name: "easyblog_cat_parentid", using: :btree
  add_index "wlje4_easyblog_category", ["private"], name: "easyblog_cat_private", using: :btree
  add_index "wlje4_easyblog_category", ["published"], name: "easyblog_cat_published", using: :btree

  create_table "wlje4_easyblog_category_acl", force: :cascade do |t|
    t.integer "category_id", limit: 8,                   null: false
    t.integer "acl_id",      limit: 8,                   null: false
    t.string  "type",        limit: 255,                 null: false
    t.integer "content_id",  limit: 8,                   null: false
    t.boolean "status",                  default: false
  end

  add_index "wlje4_easyblog_category_acl", ["acl_id"], name: "easyblog_category_acl_id", using: :btree
  add_index "wlje4_easyblog_category_acl", ["category_id", "content_id", "type"], name: "easyblog_category_content_type", using: :btree
  add_index "wlje4_easyblog_category_acl", ["category_id"], name: "easyblog_category_acl", using: :btree
  add_index "wlje4_easyblog_category_acl", ["content_id", "type"], name: "easyblog_content_type", using: :btree

  create_table "wlje4_easyblog_category_acl_item", force: :cascade do |t|
    t.string  "action",      limit: 255,                   null: false
    t.text    "description", limit: 65535
    t.boolean "published",                 default: false, null: false
    t.boolean "default",                   default: true
  end

  create_table "wlje4_easyblog_category_subscription", force: :cascade do |t|
    t.integer  "category_id", limit: 8,               null: false
    t.integer  "user_id",     limit: 8,   default: 0
    t.string   "fullname",    limit: 255
    t.string   "email",       limit: 100,             null: false
    t.datetime "created",                             null: false
  end

  add_index "wlje4_easyblog_category_subscription", ["category_id"], name: "easyblog_category_subscription_category_id", using: :btree
  add_index "wlje4_easyblog_category_subscription", ["user_id"], name: "easyblog_category_subscription_user_id", using: :btree

  create_table "wlje4_easyblog_comment", force: :cascade do |t|
    t.integer  "post_id",      limit: 8,                     null: false
    t.text     "comment",      limit: 65535
    t.string   "name",         limit: 255,                   null: false
    t.string   "title",        limit: 255,                   null: false
    t.string   "email",        limit: 255,   default: ""
    t.string   "url",          limit: 255,   default: ""
    t.string   "ip",           limit: 255,   default: ""
    t.integer  "created_by",   limit: 8,     default: 0
    t.datetime "created",                                    null: false
    t.datetime "modified"
    t.boolean  "published",                  default: false, null: false
    t.datetime "publish_up"
    t.datetime "publish_down"
    t.boolean  "ordering",                   default: false, null: false
    t.integer  "vote",         limit: 4,     default: 0,     null: false
    t.integer  "hits",         limit: 4,     default: 0,     null: false
    t.boolean  "sent",                       default: true
    t.integer  "parent_id",    limit: 4,     default: 0
    t.integer  "lft",          limit: 4,     default: 0,     null: false
    t.integer  "rgt",          limit: 4,     default: 0,     null: false
  end

  add_index "wlje4_easyblog_comment", ["parent_id"], name: "easyblog_comment_parent_id", using: :btree
  add_index "wlje4_easyblog_comment", ["post_id"], name: "easyblog_comment_postid", using: :btree

  create_table "wlje4_easyblog_configs", id: false, force: :cascade do |t|
    t.string "name",   limit: 255,   null: false
    t.text   "params", limit: 65535, null: false
  end

  create_table "wlje4_easyblog_drafts", force: :cascade do |t|
    t.integer  "entry_id",                 limit: 8,                          null: false
    t.integer  "created_by",               limit: 8,                          null: false
    t.datetime "created",                                                     null: false
    t.datetime "modified"
    t.text     "title",                    limit: 65535
    t.text     "permalink",                limit: 65535,                      null: false
    t.text     "content",                  limit: 4294967295,                 null: false
    t.text     "intro",                    limit: 4294967295,                 null: false
    t.integer  "category_id",              limit: 8,                          null: false
    t.boolean  "published",                                   default: false, null: false
    t.datetime "publish_up"
    t.datetime "publish_down"
    t.boolean  "ordering",                                    default: false, null: false
    t.integer  "vote",                     limit: 4,          default: 0,     null: false
    t.integer  "hits",                     limit: 4,          default: 0,     null: false
    t.integer  "private",                  limit: 4,          default: 0,     null: false
    t.integer  "allowcomment",             limit: 1,          default: 1,     null: false
    t.integer  "subscription",             limit: 1,          default: 1,     null: false
    t.integer  "frontpage",                limit: 1,          default: 0,     null: false
    t.integer  "isnew",                    limit: 1,          default: 0
    t.boolean  "ispending",                                   default: false
    t.boolean  "issitewide",                                  default: true
    t.string   "blogpassword",             limit: 255,                        null: false
    t.text     "tags",                     limit: 65535,                      null: false
    t.text     "metakey",                  limit: 65535,                      null: false
    t.text     "metadesc",                 limit: 65535,                      null: false
    t.text     "trackbacks",               limit: 65535,                      null: false
    t.boolean  "blog_contribute",                                             null: false
    t.text     "autopost",                 limit: 65535,                      null: false
    t.text     "autopost_centralized",     limit: 65535,                      null: false
    t.integer  "pending_approval",         limit: 1,          default: 0
    t.string   "latitude",                 limit: 255
    t.string   "longitude",                limit: 255
    t.text     "address",                  limit: 65535
    t.text     "external_source",          limit: 65535
    t.integer  "external_group_id",        limit: 4
    t.text     "robots",                   limit: 65535
    t.text     "copyrights",               limit: 65535
    t.string   "language",                 limit: 7,                          null: false
    t.string   "source",                   limit: 255,                        null: false
    t.text     "image",                    limit: 65535,                      null: false
    t.boolean  "send_notification_emails",                    default: true,  null: false
  end

  add_index "wlje4_easyblog_drafts", ["category_id"], name: "easyblog_post_catid", using: :btree
  add_index "wlje4_easyblog_drafts", ["created_by"], name: "easyblog_post_created_by", using: :btree
  add_index "wlje4_easyblog_drafts", ["pending_approval"], name: "easyblog_post_pending_approval", using: :btree
  add_index "wlje4_easyblog_drafts", ["published"], name: "easyblog_post_published", using: :btree

  create_table "wlje4_easyblog_external", force: :cascade do |t|
    t.text    "source",  limit: 65535, null: false
    t.integer "post_id", limit: 8,     null: false
    t.integer "uid",     limit: 4,     null: false
  end

  add_index "wlje4_easyblog_external", ["post_id"], name: "external_groups_post_id", using: :btree
  add_index "wlje4_easyblog_external", ["uid", "post_id"], name: "external_groups_posts", using: :btree
  add_index "wlje4_easyblog_external", ["uid"], name: "external_groups_group_id", using: :btree

  create_table "wlje4_easyblog_external_groups", force: :cascade do |t|
    t.text    "source",   limit: 65535, null: false
    t.integer "post_id",  limit: 8,     null: false
    t.integer "group_id", limit: 4,     null: false
  end

  add_index "wlje4_easyblog_external_groups", ["group_id", "post_id"], name: "external_groups_posts", using: :btree
  add_index "wlje4_easyblog_external_groups", ["group_id"], name: "external_groups_group_id", using: :btree
  add_index "wlje4_easyblog_external_groups", ["post_id"], name: "external_groups_post_id", using: :btree

  create_table "wlje4_easyblog_featured", force: :cascade do |t|
    t.integer  "content_id", limit: 8,   null: false
    t.string   "type",       limit: 255, null: false
    t.datetime "created",                null: false
  end

  add_index "wlje4_easyblog_featured", ["content_id", "type"], name: "easyblog_featured_content_type", using: :btree
  add_index "wlje4_easyblog_featured", ["content_id"], name: "easyblog_content", using: :btree

  create_table "wlje4_easyblog_feedburner", force: :cascade do |t|
    t.integer "userid", limit: 8,   null: false
    t.string  "url",    limit: 255
  end

  create_table "wlje4_easyblog_feeds", force: :cascade do |t|
    t.text     "title",             limit: 65535,             null: false
    t.text     "url",               limit: 65535,             null: false
    t.integer  "interval",          limit: 4,                 null: false
    t.integer  "cron",              limit: 1,                 null: false
    t.integer  "item_creator",      limit: 4,                 null: false
    t.integer  "item_category",     limit: 8,                 null: false
    t.integer  "item_frontpage",    limit: 1,                 null: false
    t.integer  "item_published",    limit: 1,                 null: false
    t.text     "item_content",      limit: 65535,             null: false
    t.integer  "item_get_fulltext", limit: 1,     default: 0, null: false
    t.integer  "author",            limit: 1,                 null: false
    t.text     "params",            limit: 65535,             null: false
    t.integer  "published",         limit: 1,                 null: false
    t.datetime "created",                                     null: false
    t.datetime "last_import",                                 null: false
    t.integer  "flag",              limit: 1,     default: 0
  end

  add_index "wlje4_easyblog_feeds", ["author"], name: "author", using: :btree
  add_index "wlje4_easyblog_feeds", ["cron"], name: "cron", using: :btree
  add_index "wlje4_easyblog_feeds", ["item_creator"], name: "item_creator", using: :btree
  add_index "wlje4_easyblog_feeds", ["item_frontpage"], name: "item_frontpage", using: :btree

  create_table "wlje4_easyblog_feeds_history", force: :cascade do |t|
    t.integer  "feed_id", limit: 8,     null: false
    t.integer  "post_id", limit: 4,     null: false
    t.text     "uid",     limit: 65535, null: false
    t.datetime "created",               null: false
  end

  add_index "wlje4_easyblog_feeds_history", ["feed_id", "post_id"], name: "feed_post_id", using: :btree
  add_index "wlje4_easyblog_feeds_history", ["feed_id", "uid"], name: "feed_uids", length: {"feed_id"=>nil, "uid"=>255}, using: :btree

  create_table "wlje4_easyblog_hashkeys", force: :cascade do |t|
    t.integer "uid",  limit: 8,     null: false
    t.string  "type", limit: 255,   null: false
    t.text    "key",  limit: 65535, null: false
  end

  add_index "wlje4_easyblog_hashkeys", ["type"], name: "type", using: :btree
  add_index "wlje4_easyblog_hashkeys", ["uid"], name: "uid", using: :btree

  create_table "wlje4_easyblog_likes", force: :cascade do |t|
    t.string   "type",       limit: 20,             null: false
    t.integer  "content_id", limit: 4,              null: false
    t.integer  "created_by", limit: 8,  default: 0
    t.datetime "created",                           null: false
  end

  add_index "wlje4_easyblog_likes", ["content_id"], name: "easyblog_contentid", using: :btree
  add_index "wlje4_easyblog_likes", ["created_by"], name: "easyblog_createdby", using: :btree
  add_index "wlje4_easyblog_likes", ["type", "content_id"], name: "easyblog_content_type", using: :btree

  create_table "wlje4_easyblog_mailq", force: :cascade do |t|
    t.string   "mailfrom",  limit: 255
    t.string   "fromname",  limit: 255
    t.string   "recipient", limit: 255,                   null: false
    t.text     "subject",   limit: 65535,                 null: false
    t.text     "body",      limit: 65535,                 null: false
    t.datetime "created",                                 null: false
    t.boolean  "status",                  default: false, null: false
  end

  add_index "wlje4_easyblog_mailq", ["status"], name: "easyblog_mailq_status", using: :btree

  create_table "wlje4_easyblog_mediamanager", force: :cascade do |t|
    t.text   "path",   limit: 65535,      null: false
    t.string "type",   limit: 255,        null: false
    t.text   "params", limit: 4294967295, null: false
  end

  add_index "wlje4_easyblog_mediamanager", ["path"], name: "path", type: :fulltext
  add_index "wlje4_easyblog_mediamanager", ["type"], name: "type", using: :btree

  create_table "wlje4_easyblog_meta", force: :cascade do |t|
    t.string  "type",        limit: 20,                null: false
    t.integer "content_id",  limit: 4,                 null: false
    t.text    "keywords",    limit: 65535
    t.text    "description", limit: 65535
    t.integer "indexing",    limit: 4,     default: 1, null: false
  end

  create_table "wlje4_easyblog_migrate_content", force: :cascade do |t|
    t.integer "content_id", limit: 8,                           null: false
    t.integer "post_id",    limit: 8,                           null: false
    t.string  "session_id", limit: 255,                         null: false
    t.string  "component",  limit: 255, default: "com_content", null: false
    t.string  "filename",   limit: 255, default: ""
  end

  add_index "wlje4_easyblog_migrate_content", ["content_id", "component"], name: "component_content", using: :btree
  add_index "wlje4_easyblog_migrate_content", ["content_id"], name: "content_id", using: :btree
  add_index "wlje4_easyblog_migrate_content", ["post_id"], name: "post_id", using: :btree
  add_index "wlje4_easyblog_migrate_content", ["session_id"], name: "session_id", using: :btree

  create_table "wlje4_easyblog_oauth", force: :cascade do |t|
    t.integer  "user_id",       limit: 4,                 null: false
    t.string   "type",          limit: 255,               null: false
    t.boolean  "auto",                                    null: false
    t.text     "request_token", limit: 65535,             null: false
    t.text     "access_token",  limit: 65535,             null: false
    t.text     "message",       limit: 65535,             null: false
    t.datetime "created",                                 null: false
    t.integer  "private",       limit: 1,                 null: false
    t.text     "params",        limit: 65535,             null: false
    t.integer  "system",        limit: 1,     default: 0
  end

  add_index "wlje4_easyblog_oauth", ["user_id", "type"], name: "easyblog_oauth_user_type", using: :btree

  create_table "wlje4_easyblog_oauth_posts", force: :cascade do |t|
    t.integer  "oauth_id", limit: 4, null: false
    t.integer  "post_id",  limit: 4, null: false
    t.datetime "created",            null: false
    t.datetime "modified",           null: false
    t.datetime "sent",               null: false
  end

  add_index "wlje4_easyblog_oauth_posts", ["oauth_id", "post_id"], name: "easyblog_oauth_posts_ids", using: :btree

  create_table "wlje4_easyblog_post", force: :cascade do |t|
    t.integer  "created_by",               limit: 8,                          null: false
    t.datetime "created",                                                     null: false
    t.datetime "modified"
    t.text     "title",                    limit: 65535
    t.text     "permalink",                limit: 65535,                      null: false
    t.text     "content",                  limit: 4294967295,                 null: false
    t.text     "intro",                    limit: 4294967295,                 null: false
    t.text     "excerpt",                  limit: 65535
    t.integer  "category_id",              limit: 8,                          null: false
    t.boolean  "published",                                   default: false, null: false
    t.datetime "publish_up"
    t.datetime "publish_down"
    t.boolean  "ordering",                                    default: false, null: false
    t.integer  "vote",                     limit: 4,          default: 0,     null: false
    t.integer  "hits",                     limit: 4,          default: 0,     null: false
    t.integer  "private",                  limit: 4,          default: 0,     null: false
    t.integer  "allowcomment",             limit: 1,          default: 1,     null: false
    t.integer  "subscription",             limit: 1,          default: 1,     null: false
    t.integer  "frontpage",                limit: 1,          default: 0,     null: false
    t.integer  "isnew",                    limit: 1,          default: 0
    t.boolean  "ispending",                                   default: false
    t.boolean  "issitewide",                                  default: true
    t.string   "blogpassword",             limit: 100,        default: "",    null: false
    t.string   "latitude",                 limit: 255
    t.string   "longitude",                limit: 255
    t.text     "address",                  limit: 65535
    t.integer  "system",                   limit: 1,          default: 0
    t.string   "source",                   limit: 255,                        null: false
    t.text     "robots",                   limit: 65535
    t.text     "copyrights",               limit: 65535
    t.text     "image",                    limit: 65535
    t.string   "language",                 limit: 7,                          null: false
    t.boolean  "send_notification_emails",                    default: true,  null: false
  end

  add_index "wlje4_easyblog_post", ["category_id"], name: "easyblog_post_catid", using: :btree
  add_index "wlje4_easyblog_post", ["created_by"], name: "easyblog_post_created_by", using: :btree
  add_index "wlje4_easyblog_post", ["private", "published", "issitewide", "created"], name: "easyblog_post_search", using: :btree
  add_index "wlje4_easyblog_post", ["published", "id", "created_by"], name: "easyblog_post_blogger_list", using: :btree
  add_index "wlje4_easyblog_post", ["published"], name: "easyblog_post_published", using: :btree

  create_table "wlje4_easyblog_post_rejected", force: :cascade do |t|
    t.integer  "draft_id",   limit: 8,     null: false
    t.integer  "created_by", limit: 4,     null: false
    t.text     "message",    limit: 65535, null: false
    t.datetime "created",                  null: false
  end

  add_index "wlje4_easyblog_post_rejected", ["draft_id"], name: "draft_id", using: :btree

  create_table "wlje4_easyblog_post_subscription", force: :cascade do |t|
    t.integer  "post_id",  limit: 8,               null: false
    t.integer  "user_id",  limit: 8,   default: 0
    t.string   "fullname", limit: 255
    t.string   "email",    limit: 100,             null: false
    t.datetime "created",                          null: false
  end

  add_index "wlje4_easyblog_post_subscription", ["post_id"], name: "easyblog_post_subscription_post_id", using: :btree
  add_index "wlje4_easyblog_post_subscription", ["user_id"], name: "easyblog_post_subscription_user_id", using: :btree

  create_table "wlje4_easyblog_post_tag", force: :cascade do |t|
    t.integer  "tag_id",  limit: 8, null: false
    t.integer  "post_id", limit: 8, null: false
    t.datetime "created",           null: false
  end

  add_index "wlje4_easyblog_post_tag", ["post_id"], name: "easyblog_post_tag_post_id", using: :btree
  add_index "wlje4_easyblog_post_tag", ["tag_id", "post_id"], name: "easyblog_post_tagpost_id", using: :btree
  add_index "wlje4_easyblog_post_tag", ["tag_id"], name: "easyblog_post_tag_tag_id", using: :btree

  create_table "wlje4_easyblog_ratings", force: :cascade do |t|
    t.integer  "uid",        limit: 4,   null: false
    t.string   "type",       limit: 255, null: false
    t.integer  "created_by", limit: 4,   null: false
    t.string   "sessionid",  limit: 200, null: false
    t.integer  "value",      limit: 4,   null: false
    t.string   "ip",         limit: 50,  null: false
    t.integer  "published",  limit: 1,   null: false
    t.datetime "created",                null: false
  end

  add_index "wlje4_easyblog_ratings", ["created_by"], name: "created_by", using: :btree
  add_index "wlje4_easyblog_ratings", ["uid"], name: "post_id", using: :btree
  add_index "wlje4_easyblog_ratings", ["value"], name: "rating", using: :btree

  create_table "wlje4_easyblog_reports", force: :cascade do |t|
    t.integer  "obj_id",     limit: 8,     null: false
    t.string   "obj_type",   limit: 255,   null: false
    t.text     "reason",     limit: 65535, null: false
    t.integer  "created_by", limit: 4,     null: false
    t.datetime "created",                  null: false
    t.text     "ip",         limit: 65535, null: false
  end

  add_index "wlje4_easyblog_reports", ["obj_id", "created_by"], name: "obj_id", using: :btree

  create_table "wlje4_easyblog_site_subscription", force: :cascade do |t|
    t.integer  "user_id",  limit: 8,   default: 0
    t.string   "fullname", limit: 255
    t.string   "email",    limit: 100,             null: false
    t.datetime "created",                          null: false
  end

  add_index "wlje4_easyblog_site_subscription", ["email"], name: "easyblog_site_subscription_email", using: :btree
  add_index "wlje4_easyblog_site_subscription", ["user_id"], name: "easyblog_site_subscription_user_id", using: :btree

  create_table "wlje4_easyblog_stream", force: :cascade do |t|
    t.integer  "actor_id",     limit: 8,                  null: false
    t.integer  "target_id",    limit: 8,     default: 0
    t.string   "context_type", limit: 255,   default: ""
    t.integer  "context_id",   limit: 8,     default: 0
    t.text     "verb",         limit: 65535
    t.integer  "source_id",    limit: 8,     default: 0
    t.datetime "created",                                 null: false
    t.text     "uuid",         limit: 65535
  end

  add_index "wlje4_easyblog_stream", ["actor_id", "created"], name: "easyblog_stream_actor_timeline", using: :btree
  add_index "wlje4_easyblog_stream", ["actor_id"], name: "easyblog_stream_actor", using: :btree
  add_index "wlje4_easyblog_stream", ["target_id", "created"], name: "easyblog_stream_target_timeline", using: :btree

  create_table "wlje4_easyblog_tag", force: :cascade do |t|
    t.integer  "created_by", limit: 4,                   null: false
    t.string   "title",      limit: 255,                 null: false
    t.string   "alias",      limit: 255
    t.datetime "created",                                null: false
    t.boolean  "status",                 default: false, null: false
    t.boolean  "published",              default: false, null: false
    t.boolean  "default",                default: false, null: false
    t.boolean  "ordering",               default: false, null: false
  end

  add_index "wlje4_easyblog_tag", ["alias"], name: "easyblog_tag_alias", using: :btree
  add_index "wlje4_easyblog_tag", ["published", "id", "title"], name: "easyblog_tag_query1", using: :btree
  add_index "wlje4_easyblog_tag", ["published"], name: "easyblog_tag_published", using: :btree
  add_index "wlje4_easyblog_tag", ["title"], name: "easyblog_tag_title", using: :btree

  create_table "wlje4_easyblog_team", force: :cascade do |t|
    t.text     "title",       limit: 65535,                null: false
    t.string   "alias",       limit: 255
    t.text     "description", limit: 65535,                null: false
    t.string   "avatar",      limit: 255
    t.boolean  "access",                    default: true
    t.boolean  "published",                                null: false
    t.datetime "created",                                  null: false
  end

  create_table "wlje4_easyblog_team_groups", id: false, force: :cascade do |t|
    t.integer "team_id",  limit: 4, null: false
    t.integer "group_id", limit: 4, null: false
  end

  add_index "wlje4_easyblog_team_groups", ["group_id"], name: "group_id", using: :btree
  add_index "wlje4_easyblog_team_groups", ["team_id"], name: "team_id", using: :btree

  create_table "wlje4_easyblog_team_post", id: false, force: :cascade do |t|
    t.integer "team_id", limit: 4, null: false
    t.integer "post_id", limit: 8, null: false
  end

  add_index "wlje4_easyblog_team_post", ["post_id"], name: "easyblog_teampost_pid", using: :btree
  add_index "wlje4_easyblog_team_post", ["team_id"], name: "easyblog_teampost_tid", using: :btree

  create_table "wlje4_easyblog_team_request", force: :cascade do |t|
    t.integer  "team_id",   limit: 4,                 null: false
    t.integer  "user_id",   limit: 4,                 null: false
    t.boolean  "ispending",           default: false, null: false
    t.datetime "created",                             null: false
  end

  add_index "wlje4_easyblog_team_request", ["ispending"], name: "easyblog_team_request_pending", using: :btree
  add_index "wlje4_easyblog_team_request", ["team_id"], name: "easyblog_team_request_teamid", using: :btree
  add_index "wlje4_easyblog_team_request", ["user_id"], name: "easyblog_team_request_userid", using: :btree

  create_table "wlje4_easyblog_team_subscription", force: :cascade do |t|
    t.integer  "team_id",  limit: 8,               null: false
    t.integer  "user_id",  limit: 8,   default: 0
    t.string   "fullname", limit: 255
    t.string   "email",    limit: 100,             null: false
    t.datetime "created",                          null: false
  end

  add_index "wlje4_easyblog_team_subscription", ["team_id"], name: "easyblog_team_subscription_team_id", using: :btree
  add_index "wlje4_easyblog_team_subscription", ["user_id"], name: "easyblog_team_subscription_user_id", using: :btree

  create_table "wlje4_easyblog_team_users", id: false, force: :cascade do |t|
    t.integer "team_id", limit: 4,                 null: false
    t.integer "user_id", limit: 4,                 null: false
    t.boolean "isadmin",           default: false
  end

  add_index "wlje4_easyblog_team_users", ["team_id", "user_id", "isadmin"], name: "easyblog_team_isadmin", using: :btree
  add_index "wlje4_easyblog_team_users", ["team_id"], name: "easyblog_team_id", using: :btree
  add_index "wlje4_easyblog_team_users", ["user_id"], name: "easyblog_team_userid", using: :btree

  create_table "wlje4_easyblog_trackback", force: :cascade do |t|
    t.integer  "post_id",   limit: 8,     default: 0,     null: false
    t.string   "ip",        limit: 25,    default: "",    null: false
    t.text     "title",     limit: 65535,                 null: false
    t.text     "excerpt",   limit: 65535,                 null: false
    t.string   "url",       limit: 255,   default: "",    null: false
    t.text     "blog_name", limit: 65535,                 null: false
    t.string   "charset",   limit: 45,    default: "",    null: false
    t.datetime "created",                                 null: false
    t.boolean  "published",               default: false, null: false
    t.string   "option",    limit: 64,    default: "",    null: false
  end

  add_index "wlje4_easyblog_trackback", ["ip"], name: "easyblog_tb_ip", using: :btree
  add_index "wlje4_easyblog_trackback", ["post_id"], name: "easyblog_tb_post_id", using: :btree
  add_index "wlje4_easyblog_trackback", ["url"], name: "easyblog_tb_url", using: :btree

  create_table "wlje4_easyblog_trackback_sent", force: :cascade do |t|
    t.integer "post_id", limit: 8,                  null: false
    t.string  "url",     limit: 255,                null: false
    t.boolean "sent",                default: true
  end

  add_index "wlje4_easyblog_trackback_sent", ["post_id"], name: "easyblog_tb_sent_post_id", using: :btree
  add_index "wlje4_easyblog_trackback_sent", ["url"], name: "easyblog_tb_sent_url", using: :btree

  create_table "wlje4_easyblog_twitter_microblog", id: false, force: :cascade do |t|
    t.text     "id_str",       limit: 65535, null: false
    t.integer  "oauth_id",     limit: 4,     null: false
    t.integer  "post_id",      limit: 8,     null: false
    t.datetime "created",                    null: false
    t.text     "tweet_author", limit: 65535, null: false
  end

  add_index "wlje4_easyblog_twitter_microblog", ["id_str"], name: "id_str", type: :fulltext
  add_index "wlje4_easyblog_twitter_microblog", ["post_id"], name: "post_id", using: :btree

  create_table "wlje4_easyblog_users", force: :cascade do |t|
    t.string  "nickname",    limit: 255
    t.string  "avatar",      limit: 255
    t.text    "description", limit: 65535
    t.string  "url",         limit: 255
    t.text    "params",      limit: 65535
    t.boolean "published",                 default: true, null: false
    t.string  "title",       limit: 255,   default: "",   null: false
    t.text    "biography",   limit: 65535
    t.string  "permalink",   limit: 255
  end

  add_index "wlje4_easyblog_users", ["permalink"], name: "easyblog_users_permalink", using: :btree

  create_table "wlje4_easyblog_xml_wpdata", force: :cascade do |t|
    t.string  "session_id", limit: 255,        null: false
    t.string  "filename",   limit: 255,        null: false
    t.integer "post_id",    limit: 8,          null: false
    t.string  "source",     limit: 15,         null: false
    t.text    "data",       limit: 4294967295, null: false
    t.text    "comments",   limit: 4294967295
  end

  add_index "wlje4_easyblog_xml_wpdata", ["post_id", "source"], name: "xml_wpdate_post_source", using: :btree
  add_index "wlje4_easyblog_xml_wpdata", ["session_id"], name: "xml_wpdate_session", using: :btree

  create_table "wlje4_easyjoomlabackup", force: :cascade do |t|
    t.datetime "date",                 null: false
    t.text     "comment",  limit: 255, null: false
    t.string   "type",     limit: 32,  null: false
    t.string   "size",     limit: 12,  null: false
    t.string   "duration", limit: 8,   null: false
    t.text     "name",     limit: 255, null: false
  end

  add_index "wlje4_easyjoomlabackup", ["id"], name: "id", unique: true, using: :btree

  create_table "wlje4_example_items", force: :cascade do |t|
  end

  create_table "wlje4_extensions", primary_key: "extension_id", force: :cascade do |t|
    t.string   "name",             limit: 100,                null: false
    t.string   "type",             limit: 20,                 null: false
    t.string   "element",          limit: 100,                null: false
    t.string   "folder",           limit: 100,                null: false
    t.integer  "client_id",        limit: 1,                  null: false
    t.integer  "enabled",          limit: 1,     default: 1,  null: false
    t.integer  "access",           limit: 4,     default: 1,  null: false
    t.integer  "protected",        limit: 1,     default: 0,  null: false
    t.text     "manifest_cache",   limit: 65535,              null: false
    t.text     "params",           limit: 65535,              null: false
    t.text     "custom_data",      limit: 65535,              null: false
    t.text     "system_data",      limit: 65535,              null: false
    t.integer  "checked_out",      limit: 4,     default: 0,  null: false
    t.datetime "checked_out_time",                            null: false
    t.integer  "ordering",         limit: 4,     default: 0
    t.integer  "state",            limit: 4,     default: 0
    t.string   "extra_params",     limit: 5120,  default: "", null: false
  end

  add_index "wlje4_extensions", ["element", "client_id"], name: "element_clientid", using: :btree
  add_index "wlje4_extensions", ["element", "folder", "client_id"], name: "element_folder_clientid", using: :btree
  add_index "wlje4_extensions", ["type", "element", "folder", "client_id"], name: "extension", using: :btree

  create_table "wlje4_facileforms_compmenus", force: :cascade do |t|
    t.string  "package",   limit: 30,    default: "",    null: false
    t.integer "parent",    limit: 4,     default: 0,     null: false
    t.integer "ordering",  limit: 4,     default: 0,     null: false
    t.boolean "published",               default: false, null: false
    t.string  "img",       limit: 255,   default: "",    null: false
    t.string  "title",     limit: 255,   default: "",    null: false
    t.string  "name",      limit: 255,   default: "",    null: false
    t.integer "page",      limit: 4,     default: 1,     null: false
    t.boolean "frame",                   default: false, null: false
    t.boolean "border",                  default: false, null: false
    t.text    "params",    limit: 65535
  end

  create_table "wlje4_facileforms_config", force: :cascade do |t|
    t.text "value", limit: 65535
  end

  create_table "wlje4_facileforms_elements", force: :cascade do |t|
    t.integer "form",         limit: 4,     default: 0,     null: false
    t.integer "page",         limit: 4,     default: 1,     null: false
    t.integer "ordering",     limit: 4,     default: 0,     null: false
    t.boolean "published",                  default: false, null: false
    t.string  "name",         limit: 255,   default: "",    null: false
    t.string  "title",        limit: 255,   default: "",    null: false
    t.string  "type",         limit: 50,    default: "",    null: false
    t.string  "class1",       limit: 30
    t.string  "class2",       limit: 30
    t.boolean "logging",                    default: true,  null: false
    t.integer "posx",         limit: 4
    t.boolean "posxmode",                   default: false, null: false
    t.integer "posy",         limit: 4
    t.boolean "posymode",                   default: false, null: false
    t.integer "width",        limit: 4
    t.boolean "widthmode",                  default: false, null: false
    t.integer "height",       limit: 4
    t.boolean "heightmode",                 default: false, null: false
    t.boolean "flag1",                      default: false, null: false
    t.boolean "flag2",                      default: false, null: false
    t.text    "data1",        limit: 65535
    t.text    "data2",        limit: 65535
    t.text    "data3",        limit: 65535
    t.boolean "script1cond",                default: false, null: false
    t.integer "script1id",    limit: 4
    t.text    "script1code",  limit: 65535
    t.boolean "script1flag1",               default: false, null: false
    t.boolean "script1flag2",               default: false, null: false
    t.boolean "script2cond",                default: false, null: false
    t.integer "script2id",    limit: 4
    t.text    "script2code",  limit: 65535
    t.boolean "script2flag1",               default: false, null: false
    t.boolean "script2flag2",               default: false, null: false
    t.boolean "script2flag3",               default: false, null: false
    t.boolean "script2flag4",               default: false, null: false
    t.boolean "script2flag5",               default: false, null: false
    t.boolean "script3cond",                default: false, null: false
    t.integer "script3id",    limit: 4
    t.text    "script3code",  limit: 65535
    t.text    "script3msg",   limit: 65535
    t.boolean "mailback",                   default: false, null: false
    t.text    "mailbackfile", limit: 65535,                 null: false
  end

  create_table "wlje4_facileforms_forms", force: :cascade do |t|
    t.text    "alt_mailfrom",                          limit: 65535
    t.text    "alt_fromname",                          limit: 65535
    t.text    "mb_alt_mailfrom",                       limit: 65535
    t.text    "mb_alt_fromname",                       limit: 65535
    t.string  "mailchimp_email_field",                 limit: 255,        default: "",                    null: false
    t.string  "mailchimp_checkbox_field",              limit: 255,        default: "",                    null: false
    t.string  "mailchimp_api_key",                     limit: 255,        default: "",                    null: false
    t.string  "mailchimp_list_id",                     limit: 255,        default: "",                    null: false
    t.boolean "mailchimp_double_optin",                                   default: true,                  null: false
    t.text    "mailchimp_mergevars",                   limit: 65535
    t.string  "mailchimp_text_html_mobile_field",      limit: 255,        default: "",                    null: false
    t.boolean "mailchimp_send_errors",                                    default: false,                 null: false
    t.boolean "mailchimp_update_existing",                                default: false,                 null: false
    t.boolean "mailchimp_replace_interests",                              default: false,                 null: false
    t.boolean "mailchimp_send_welcome",                                   default: false,                 null: false
    t.string  "mailchimp_default_type",                limit: 255,        default: "text",                null: false
    t.boolean "mailchimp_delete_member",                                  default: false,                 null: false
    t.boolean "mailchimp_send_goodbye",                                   default: true,                  null: false
    t.boolean "mailchimp_send_notify",                                    default: true,                  null: false
    t.string  "mailchimp_unsubscribe_field",           limit: 255,        default: "",                    null: false
    t.string  "salesforce_token",                      limit: 255,        default: "",                    null: false
    t.string  "salesforce_username",                   limit: 255,        default: "",                    null: false
    t.string  "salesforce_password",                   limit: 255,        default: "",                    null: false
    t.string  "salesforce_type",                       limit: 255,        default: "",                    null: false
    t.text    "salesforce_fields",                     limit: 65535
    t.boolean "salesforce_enabled",                                       default: false,                 null: false
    t.string  "dropbox_email",                         limit: 255,        default: "",                    null: false
    t.string  "dropbox_password",                      limit: 255,        default: "",                    null: false
    t.text    "dropbox_folder",                        limit: 65535
    t.boolean "dropbox_submission_enabled",                               default: false,                 null: false
    t.string  "dropbox_submission_types",              limit: 255,        default: "pdf",                 null: false
    t.text    "tags_content",                          limit: 65535,                                      null: false
    t.text    "tags_content_template",                 limit: 16777215,                                   null: false
    t.integer "tags_content_template_default_element", limit: 4,          default: 0,                     null: false
    t.integer "tags_content_default_category",         limit: 4,          default: 0,                     null: false
    t.integer "tags_content_default_state",            limit: 4,          default: 1,                     null: false
    t.integer "tags_content_default_access",           limit: 4,          default: 1,                     null: false
    t.string  "tags_content_default_language",         limit: 7,          default: "*",                   null: false
    t.integer "tags_content_default_featured",         limit: 4,          default: 0,                     null: false
    t.string  "tags_content_default_publishup",        limit: 255,        default: "0000-00-00 00:00:00", null: false
    t.string  "tags_content_default_publishdown",      limit: 255,        default: "0000-00-00 00:00:00", null: false
    t.text    "tags_form",                             limit: 65535,                                      null: false
    t.boolean "autoheight",                                               default: false,                 null: false
    t.string  "package",                               limit: 30,         default: "",                    null: false
    t.text    "template_code",                         limit: 4294967295,                                 null: false
    t.text    "template_code_processed",               limit: 4294967295,                                 null: false
    t.text    "template_areas",                        limit: 4294967295,                                 null: false
    t.integer "ordering",                              limit: 4,          default: 0,                     null: false
    t.boolean "published",                                                default: false,                 null: false
    t.boolean "runmode",                                                  default: false,                 null: false
    t.string  "name",                                  limit: 255,        default: "",                    null: false
    t.string  "custom_mail_subject",                   limit: 255,        default: "",                    null: false
    t.string  "mb_custom_mail_subject",                limit: 255,        default: "",                    null: false
    t.string  "title",                                 limit: 255,        default: "",                    null: false
    t.text    "description",                           limit: 65535
    t.string  "class1",                                limit: 30
    t.string  "class2",                                limit: 30
    t.integer "width",                                 limit: 4,          default: 0,                     null: false
    t.boolean "widthmode",                                                default: false,                 null: false
    t.integer "height",                                limit: 4,          default: 0,                     null: false
    t.boolean "heightmode",                                               default: false,                 null: false
    t.integer "pages",                                 limit: 4,          default: 1,                     null: false
    t.boolean "emailntf",                                                 default: true,                  null: false
    t.boolean "mb_emailntf",                                              default: true,                  null: false
    t.boolean "emaillog",                                                 default: true,                  null: false
    t.boolean "mb_emaillog",                                              default: true,                  null: false
    t.boolean "emailxml",                                                 default: false,                 null: false
    t.boolean "mb_emailxml",                                              default: false,                 null: false
    t.boolean "email_type",                                               default: false,                 null: false
    t.boolean "mb_email_type",                                            default: false,                 null: false
    t.text    "email_custom_template",                 limit: 65535
    t.text    "mb_email_custom_template",              limit: 65535
    t.boolean "email_custom_html",                                        default: false,                 null: false
    t.boolean "mb_email_custom_html",                                     default: false,                 null: false
    t.text    "emailadr",                              limit: 65535
    t.boolean "dblog",                                                    default: true,                  null: false
    t.boolean "script1cond",                                              default: false,                 null: false
    t.integer "script1id",                             limit: 4
    t.text    "script1code",                           limit: 65535
    t.boolean "script2cond",                                              default: false,                 null: false
    t.integer "script2id",                             limit: 4
    t.text    "script2code",                           limit: 65535
    t.boolean "piece1cond",                                               default: false,                 null: false
    t.integer "piece1id",                              limit: 4
    t.text    "piece1code",                            limit: 65535
    t.boolean "piece2cond",                                               default: false,                 null: false
    t.integer "piece2id",                              limit: 4
    t.text    "piece2code",                            limit: 65535
    t.boolean "piece3cond",                                               default: false,                 null: false
    t.integer "piece3id",                              limit: 4
    t.text    "piece3code",                            limit: 65535
    t.boolean "piece4cond",                                               default: false,                 null: false
    t.integer "piece4id",                              limit: 4
    t.text    "piece4code",                            limit: 65535
    t.boolean "prevmode",                                                 default: false,                 null: false
    t.integer "prevwidth",                             limit: 4
    t.text    "filter_state",                          limit: 65535,                                      null: false
  end

  create_table "wlje4_facileforms_integrator_criteria_fixed", force: :cascade do |t|
    t.integer "rule_id",          limit: 4,                     null: false
    t.string  "reference_column", limit: 255,                   null: false
    t.string  "operator",         limit: 255,                   null: false
    t.text    "fixed_value",      limit: 65535,                 null: false
    t.string  "andor",            limit: 3,     default: "AND", null: false
  end

  create_table "wlje4_facileforms_integrator_criteria_form", force: :cascade do |t|
    t.integer "rule_id",          limit: 4,                   null: false
    t.string  "reference_column", limit: 255,                 null: false
    t.string  "operator",         limit: 255,                 null: false
    t.string  "element_id",       limit: 255,                 null: false
    t.string  "andor",            limit: 3,   default: "AND", null: false
  end

  create_table "wlje4_facileforms_integrator_criteria_joomla", force: :cascade do |t|
    t.integer "rule_id",          limit: 4,                   null: false
    t.string  "reference_column", limit: 255,                 null: false
    t.string  "operator",         limit: 255,                 null: false
    t.string  "joomla_object",    limit: 255,                 null: false
    t.string  "andor",            limit: 3,   default: "AND", null: false
  end

  create_table "wlje4_facileforms_integrator_items", force: :cascade do |t|
    t.integer "rule_id",          limit: 4,                 null: false
    t.integer "element_id",       limit: 4,                 null: false
    t.string  "reference_column", limit: 255,               null: false
    t.text    "code",             limit: 65535
    t.integer "published",        limit: 1,     default: 1, null: false
  end

  create_table "wlje4_facileforms_integrator_rules", force: :cascade do |t|
    t.string  "name",            limit: 255,                      null: false
    t.integer "form_id",         limit: 4,                        null: false
    t.string  "reference_table", limit: 255,                      null: false
    t.string  "type",            limit: 255,   default: "insert", null: false
    t.boolean "published",                     default: true,     null: false
    t.text    "finalize_code",   limit: 65535,                    null: false
  end

  create_table "wlje4_facileforms_new_archive_record", force: :cascade do |t|
    t.integer "userid", limit: 4
    t.integer "catid",  limit: 4
  end

  create_table "wlje4_facileforms_new_archive_subrecords", force: :cascade do |t|
    t.integer "record_id",   limit: 4
    t.integer "user_id",     limit: 4
    t.integer "form_id",     limit: 4
    t.string  "field_name",  limit: 45
    t.string  "field_value", limit: 45
  end

  create_table "wlje4_facileforms_packages", force: :cascade do |t|
    t.string "name",        limit: 255, default: "", null: false
    t.string "version",     limit: 30,  default: "", null: false
    t.string "created",     limit: 20,  default: "", null: false
    t.string "title",       limit: 50,  default: "", null: false
    t.string "author",      limit: 50,  default: "", null: false
    t.string "email",       limit: 50,  default: "", null: false
    t.string "url",         limit: 50,  default: "", null: false
    t.string "description", limit: 100, default: "", null: false
    t.string "copyright",   limit: 100, default: "", null: false
  end

  create_table "wlje4_facileforms_pieces", force: :cascade do |t|
    t.boolean "published",                 default: false, null: false
    t.string  "package",     limit: 30,    default: "",    null: false
    t.string  "name",        limit: 255,   default: "",    null: false
    t.string  "title",       limit: 255,   default: "",    null: false
    t.text    "description", limit: 65535
    t.string  "type",        limit: 30,    default: "",    null: false
    t.text    "code",        limit: 65535
  end

  create_table "wlje4_facileforms_records", force: :cascade do |t|
    t.datetime "submitted",                                         null: false
    t.integer  "form",                  limit: 4,   default: 0,     null: false
    t.string   "title",                 limit: 255, default: "",    null: false
    t.string   "name",                  limit: 255, default: "",    null: false
    t.string   "ip",                    limit: 30,  default: "",    null: false
    t.string   "browser",               limit: 255, default: "",    null: false
    t.string   "opsys",                 limit: 255, default: "",    null: false
    t.string   "provider",              limit: 255, default: "",    null: false
    t.boolean  "viewed",                            default: false, null: false
    t.boolean  "exported",                          default: false, null: false
    t.boolean  "archived",                          default: false, null: false
    t.integer  "user_id",               limit: 4,   default: 0,     null: false
    t.string   "username",              limit: 255, default: "",    null: false
    t.string   "user_full_name",        limit: 255, default: "",    null: false
    t.string   "paypal_tx_id",          limit: 255, default: "",    null: false
    t.datetime "paypal_payment_date",                               null: false
    t.boolean  "paypal_testaccount",                default: false, null: false
    t.integer  "paypal_download_tries", limit: 4,   default: 0,     null: false
    t.string   "userid_formid",         limit: 45
  end

  create_table "wlje4_facileforms_scripts", force: :cascade do |t|
    t.boolean "published",                 default: false, null: false
    t.string  "package",     limit: 30,    default: "",    null: false
    t.string  "name",        limit: 30,    default: "",    null: false
    t.string  "title",       limit: 50,    default: "",    null: false
    t.text    "description", limit: 65535
    t.string  "type",        limit: 30,    default: "",    null: false
    t.text    "code",        limit: 65535
  end

  create_table "wlje4_facileforms_subrecords", force: :cascade do |t|
    t.integer "record",         limit: 4,     default: 0,  null: false
    t.integer "element",        limit: 4,     default: 0,  null: false
    t.string  "title",          limit: 255,   default: "", null: false
    t.string  "name",           limit: 255,   default: "", null: false
    t.string  "type",           limit: 255,   default: "", null: false
    t.text    "value",          limit: 65535
    t.integer "form_id",        limit: 4
    t.integer "new_element_id", limit: 4
  end

  create_table "wlje4_finder_filters", primary_key: "filter_id", force: :cascade do |t|
    t.string   "title",            limit: 255,                     null: false
    t.string   "alias",            limit: 255,                     null: false
    t.boolean  "state",                             default: true, null: false
    t.datetime "created",                                          null: false
    t.integer  "created_by",       limit: 4,                       null: false
    t.string   "created_by_alias", limit: 255,                     null: false
    t.datetime "modified",                                         null: false
    t.integer  "modified_by",      limit: 4,        default: 0,    null: false
    t.integer  "checked_out",      limit: 4,        default: 0,    null: false
    t.datetime "checked_out_time",                                 null: false
    t.integer  "map_count",        limit: 4,        default: 0,    null: false
    t.text     "data",             limit: 65535,                   null: false
    t.text     "params",           limit: 16777215
  end

  create_table "wlje4_finder_links", primary_key: "link_id", force: :cascade do |t|
    t.string   "url",                limit: 255,                     null: false
    t.string   "route",              limit: 255,                     null: false
    t.string   "title",              limit: 255
    t.string   "description",        limit: 255
    t.datetime "indexdate",                                          null: false
    t.string   "md5sum",             limit: 32
    t.boolean  "published",                           default: true, null: false
    t.integer  "state",              limit: 4,        default: 1
    t.integer  "access",             limit: 4,        default: 0
    t.string   "language",           limit: 8,                       null: false
    t.datetime "publish_start_date",                                 null: false
    t.datetime "publish_end_date",                                   null: false
    t.datetime "start_date",                                         null: false
    t.datetime "end_date",                                           null: false
    t.float    "list_price",         limit: 53,       default: 0.0,  null: false
    t.float    "sale_price",         limit: 53,       default: 0.0,  null: false
    t.integer  "type_id",            limit: 4,                       null: false
    t.binary   "object",             limit: 16777215,                null: false
  end

  add_index "wlje4_finder_links", ["md5sum"], name: "idx_md5", using: :btree
  add_index "wlje4_finder_links", ["published", "state", "access", "publish_start_date", "publish_end_date", "list_price"], name: "idx_published_list", using: :btree
  add_index "wlje4_finder_links", ["published", "state", "access", "publish_start_date", "publish_end_date", "sale_price"], name: "idx_published_sale", using: :btree
  add_index "wlje4_finder_links", ["title"], name: "idx_title", using: :btree
  add_index "wlje4_finder_links", ["type_id"], name: "idx_type", using: :btree
  add_index "wlje4_finder_links", ["url"], name: "idx_url", length: {"url"=>75}, using: :btree

  create_table "wlje4_finder_links_terms0", id: false, force: :cascade do |t|
    t.integer "link_id", limit: 4,  null: false
    t.integer "term_id", limit: 4,  null: false
    t.float   "weight",  limit: 24, null: false
  end

  add_index "wlje4_finder_links_terms0", ["link_id", "term_id", "weight"], name: "idx_link_term_weight", using: :btree
  add_index "wlje4_finder_links_terms0", ["term_id", "weight"], name: "idx_term_weight", using: :btree

  create_table "wlje4_finder_links_terms1", id: false, force: :cascade do |t|
    t.integer "link_id", limit: 4,  null: false
    t.integer "term_id", limit: 4,  null: false
    t.float   "weight",  limit: 24, null: false
  end

  add_index "wlje4_finder_links_terms1", ["link_id", "term_id", "weight"], name: "idx_link_term_weight", using: :btree
  add_index "wlje4_finder_links_terms1", ["term_id", "weight"], name: "idx_term_weight", using: :btree

  create_table "wlje4_finder_links_terms2", id: false, force: :cascade do |t|
    t.integer "link_id", limit: 4,  null: false
    t.integer "term_id", limit: 4,  null: false
    t.float   "weight",  limit: 24, null: false
  end

  add_index "wlje4_finder_links_terms2", ["link_id", "term_id", "weight"], name: "idx_link_term_weight", using: :btree
  add_index "wlje4_finder_links_terms2", ["term_id", "weight"], name: "idx_term_weight", using: :btree

  create_table "wlje4_finder_links_terms3", id: false, force: :cascade do |t|
    t.integer "link_id", limit: 4,  null: false
    t.integer "term_id", limit: 4,  null: false
    t.float   "weight",  limit: 24, null: false
  end

  add_index "wlje4_finder_links_terms3", ["link_id", "term_id", "weight"], name: "idx_link_term_weight", using: :btree
  add_index "wlje4_finder_links_terms3", ["term_id", "weight"], name: "idx_term_weight", using: :btree

  create_table "wlje4_finder_links_terms4", id: false, force: :cascade do |t|
    t.integer "link_id", limit: 4,  null: false
    t.integer "term_id", limit: 4,  null: false
    t.float   "weight",  limit: 24, null: false
  end

  add_index "wlje4_finder_links_terms4", ["link_id", "term_id", "weight"], name: "idx_link_term_weight", using: :btree
  add_index "wlje4_finder_links_terms4", ["term_id", "weight"], name: "idx_term_weight", using: :btree

  create_table "wlje4_finder_links_terms5", id: false, force: :cascade do |t|
    t.integer "link_id", limit: 4,  null: false
    t.integer "term_id", limit: 4,  null: false
    t.float   "weight",  limit: 24, null: false
  end

  add_index "wlje4_finder_links_terms5", ["link_id", "term_id", "weight"], name: "idx_link_term_weight", using: :btree
  add_index "wlje4_finder_links_terms5", ["term_id", "weight"], name: "idx_term_weight", using: :btree

  create_table "wlje4_finder_links_terms6", id: false, force: :cascade do |t|
    t.integer "link_id", limit: 4,  null: false
    t.integer "term_id", limit: 4,  null: false
    t.float   "weight",  limit: 24, null: false
  end

  add_index "wlje4_finder_links_terms6", ["link_id", "term_id", "weight"], name: "idx_link_term_weight", using: :btree
  add_index "wlje4_finder_links_terms6", ["term_id", "weight"], name: "idx_term_weight", using: :btree

  create_table "wlje4_finder_links_terms7", id: false, force: :cascade do |t|
    t.integer "link_id", limit: 4,  null: false
    t.integer "term_id", limit: 4,  null: false
    t.float   "weight",  limit: 24, null: false
  end

  add_index "wlje4_finder_links_terms7", ["link_id", "term_id", "weight"], name: "idx_link_term_weight", using: :btree
  add_index "wlje4_finder_links_terms7", ["term_id", "weight"], name: "idx_term_weight", using: :btree

  create_table "wlje4_finder_links_terms8", id: false, force: :cascade do |t|
    t.integer "link_id", limit: 4,  null: false
    t.integer "term_id", limit: 4,  null: false
    t.float   "weight",  limit: 24, null: false
  end

  add_index "wlje4_finder_links_terms8", ["link_id", "term_id", "weight"], name: "idx_link_term_weight", using: :btree
  add_index "wlje4_finder_links_terms8", ["term_id", "weight"], name: "idx_term_weight", using: :btree

  create_table "wlje4_finder_links_terms9", id: false, force: :cascade do |t|
    t.integer "link_id", limit: 4,  null: false
    t.integer "term_id", limit: 4,  null: false
    t.float   "weight",  limit: 24, null: false
  end

  add_index "wlje4_finder_links_terms9", ["link_id", "term_id", "weight"], name: "idx_link_term_weight", using: :btree
  add_index "wlje4_finder_links_terms9", ["term_id", "weight"], name: "idx_term_weight", using: :btree

  create_table "wlje4_finder_links_termsa", id: false, force: :cascade do |t|
    t.integer "link_id", limit: 4,  null: false
    t.integer "term_id", limit: 4,  null: false
    t.float   "weight",  limit: 24, null: false
  end

  add_index "wlje4_finder_links_termsa", ["link_id", "term_id", "weight"], name: "idx_link_term_weight", using: :btree
  add_index "wlje4_finder_links_termsa", ["term_id", "weight"], name: "idx_term_weight", using: :btree

  create_table "wlje4_finder_links_termsb", id: false, force: :cascade do |t|
    t.integer "link_id", limit: 4,  null: false
    t.integer "term_id", limit: 4,  null: false
    t.float   "weight",  limit: 24, null: false
  end

  add_index "wlje4_finder_links_termsb", ["link_id", "term_id", "weight"], name: "idx_link_term_weight", using: :btree
  add_index "wlje4_finder_links_termsb", ["term_id", "weight"], name: "idx_term_weight", using: :btree

  create_table "wlje4_finder_links_termsc", id: false, force: :cascade do |t|
    t.integer "link_id", limit: 4,  null: false
    t.integer "term_id", limit: 4,  null: false
    t.float   "weight",  limit: 24, null: false
  end

  add_index "wlje4_finder_links_termsc", ["link_id", "term_id", "weight"], name: "idx_link_term_weight", using: :btree
  add_index "wlje4_finder_links_termsc", ["term_id", "weight"], name: "idx_term_weight", using: :btree

  create_table "wlje4_finder_links_termsd", id: false, force: :cascade do |t|
    t.integer "link_id", limit: 4,  null: false
    t.integer "term_id", limit: 4,  null: false
    t.float   "weight",  limit: 24, null: false
  end

  add_index "wlje4_finder_links_termsd", ["link_id", "term_id", "weight"], name: "idx_link_term_weight", using: :btree
  add_index "wlje4_finder_links_termsd", ["term_id", "weight"], name: "idx_term_weight", using: :btree

  create_table "wlje4_finder_links_termse", id: false, force: :cascade do |t|
    t.integer "link_id", limit: 4,  null: false
    t.integer "term_id", limit: 4,  null: false
    t.float   "weight",  limit: 24, null: false
  end

  add_index "wlje4_finder_links_termse", ["link_id", "term_id", "weight"], name: "idx_link_term_weight", using: :btree
  add_index "wlje4_finder_links_termse", ["term_id", "weight"], name: "idx_term_weight", using: :btree

  create_table "wlje4_finder_links_termsf", id: false, force: :cascade do |t|
    t.integer "link_id", limit: 4,  null: false
    t.integer "term_id", limit: 4,  null: false
    t.float   "weight",  limit: 24, null: false
  end

  add_index "wlje4_finder_links_termsf", ["link_id", "term_id", "weight"], name: "idx_link_term_weight", using: :btree
  add_index "wlje4_finder_links_termsf", ["term_id", "weight"], name: "idx_term_weight", using: :btree

  create_table "wlje4_finder_taxonomy", force: :cascade do |t|
    t.integer "parent_id", limit: 4,   default: 0,     null: false
    t.string  "title",     limit: 255,                 null: false
    t.boolean "state",                 default: true,  null: false
    t.boolean "access",                default: false, null: false
    t.boolean "ordering",              default: false, null: false
  end

  add_index "wlje4_finder_taxonomy", ["access"], name: "access", using: :btree
  add_index "wlje4_finder_taxonomy", ["ordering"], name: "ordering", using: :btree
  add_index "wlje4_finder_taxonomy", ["parent_id", "state", "access"], name: "idx_parent_published", using: :btree
  add_index "wlje4_finder_taxonomy", ["parent_id"], name: "parent_id", using: :btree
  add_index "wlje4_finder_taxonomy", ["state"], name: "state", using: :btree

  create_table "wlje4_finder_taxonomy_map", id: false, force: :cascade do |t|
    t.integer "link_id", limit: 4, null: false
    t.integer "node_id", limit: 4, null: false
  end

  add_index "wlje4_finder_taxonomy_map", ["link_id"], name: "link_id", using: :btree
  add_index "wlje4_finder_taxonomy_map", ["node_id"], name: "node_id", using: :btree

  create_table "wlje4_finder_terms", primary_key: "term_id", force: :cascade do |t|
    t.string  "term",     limit: 75,                 null: false
    t.string  "stem",     limit: 75,                 null: false
    t.boolean "common",              default: false, null: false
    t.boolean "phrase",              default: false, null: false
    t.float   "weight",   limit: 24, default: 0.0,   null: false
    t.string  "soundex",  limit: 75,                 null: false
    t.integer "links",    limit: 4,  default: 0,     null: false
    t.string  "language", limit: 3,  default: "",    null: false
  end

  add_index "wlje4_finder_terms", ["soundex", "phrase"], name: "idx_soundex_phrase", using: :btree
  add_index "wlje4_finder_terms", ["stem", "phrase"], name: "idx_stem_phrase", using: :btree
  add_index "wlje4_finder_terms", ["term", "phrase"], name: "idx_term_phrase", using: :btree
  add_index "wlje4_finder_terms", ["term"], name: "idx_term", unique: true, using: :btree

  create_table "wlje4_finder_terms_common", id: false, force: :cascade do |t|
    t.string "term",     limit: 75, null: false
    t.string "language", limit: 3,  null: false
  end

  add_index "wlje4_finder_terms_common", ["language"], name: "idx_lang", using: :btree
  add_index "wlje4_finder_terms_common", ["term", "language"], name: "idx_word_lang", using: :btree

  create_table "wlje4_finder_tokens", id: false, force: :cascade do |t|
    t.string  "term",     limit: 75,                 null: false
    t.string  "stem",     limit: 75,                 null: false
    t.boolean "common",              default: false, null: false
    t.boolean "phrase",              default: false, null: false
    t.float   "weight",   limit: 24, default: 1.0,   null: false
    t.boolean "context",             default: false, null: false
    t.string  "language", limit: 3,  default: "",    null: false
  end

  add_index "wlje4_finder_tokens", ["context"], name: "idx_context", using: :hash
  add_index "wlje4_finder_tokens", ["term"], name: "idx_word", using: :hash

  create_table "wlje4_finder_tokens_aggregate", id: false, force: :cascade do |t|
    t.integer "term_id",        limit: 4,                  null: false
    t.string  "map_suffix",     limit: 1,                  null: false
    t.string  "term",           limit: 75,                 null: false
    t.string  "stem",           limit: 75,                 null: false
    t.boolean "common",                    default: false, null: false
    t.boolean "phrase",                    default: false, null: false
    t.float   "term_weight",    limit: 24,                 null: false
    t.boolean "context",                   default: false, null: false
    t.float   "context_weight", limit: 24,                 null: false
    t.float   "total_weight",   limit: 24,                 null: false
    t.string  "language",       limit: 3,  default: "",    null: false
  end

  add_index "wlje4_finder_tokens_aggregate", ["term"], name: "token", using: :hash
  add_index "wlje4_finder_tokens_aggregate", ["term_id"], name: "keyword_id", using: :hash

  create_table "wlje4_finder_types", force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.string "mime",  limit: 100, null: false
  end

  add_index "wlje4_finder_types", ["title"], name: "title", unique: true, using: :btree

  create_table "wlje4_html2articles_links", force: :cascade do |t|
    t.string  "filename",  limit: 255, null: false
    t.string  "alias",     limit: 255, null: false
    t.integer "catid",     limit: 4,   null: false
    t.integer "articleid", limit: 4,   null: false
  end

  add_index "wlje4_html2articles_links", ["filename"], name: "filename", using: :btree

  create_table "wlje4_html2articles_log", force: :cascade do |t|
    t.string   "filename", limit: 255,             null: false
    t.string   "details",  limit: 255,             null: false
    t.string   "value",    limit: 255,             null: false
    t.integer  "error",    limit: 1,   default: 0, null: false
    t.datetime "date",                             null: false
  end

  add_index "wlje4_html2articles_log", ["filename"], name: "filename", using: :btree

  create_table "wlje4_jak2filter", primary_key: "name", force: :cascade do |t|
    t.text     "value",      limit: 65535, null: false
    t.datetime "updatetime",               null: false
  end

  create_table "wlje4_je_jek2submit", force: :cascade do |t|
    t.string  "title",          limit: 300,        null: false
    t.integer "enabled",        limit: 1,          null: false
    t.string  "notify_email",   limit: 250,        null: false
    t.text    "message",        limit: 4294967295, null: false
    t.integer "notify",         limit: 1,          null: false
    t.text    "notify_message", limit: 4294967295, null: false
    t.integer "captcha",        limit: 1,          null: false
    t.integer "itemid",         limit: 1,          null: false
    t.integer "term",           limit: 1,          null: false
    t.integer "category",       limit: 1,          null: false
    t.string  "cat_id",         limit: 200,        null: false
    t.integer "allow_reguser",  limit: 1,          null: false
    t.integer "auto_publish",   limit: 1,          null: false
    t.integer "pageurl",        limit: 4,          null: false
    t.string  "name",           limit: 200,        null: false
    t.string  "email",          limit: 200,        null: false
    t.integer "publish",        limit: 4,          null: false
  end

  create_table "wlje4_je_k2itemlist", force: :cascade do |t|
    t.integer "itemid",    limit: 4,   null: false
    t.integer "userid",    limit: 4,   null: false
    t.string  "name",      limit: 200, null: false
    t.string  "email",     limit: 200, null: false
    t.integer "published", limit: 1,   null: false
  end

  create_table "wlje4_jfbconnect_channel", force: :cascade do |t|
    t.string   "provider",    limit: 20,                 null: false
    t.string   "type",        limit: 20
    t.string   "title",       limit: 40,    default: "", null: false
    t.text     "description", limit: 65535
    t.text     "attribs",     limit: 65535
    t.boolean  "published"
    t.datetime "created"
    t.datetime "modified"
  end

  create_table "wlje4_jfbconnect_config", force: :cascade do |t|
    t.string   "setting",    limit: 50,    null: false
    t.text     "value",      limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "wlje4_jfbconnect_config", ["setting"], name: "setting", unique: true, using: :btree

  create_table "wlje4_jfbconnect_notification", force: :cascade do |t|
    t.integer  "fb_request_id",   limit: 8, null: false
    t.integer  "fb_user_to",      limit: 8, null: false
    t.integer  "fb_user_from",    limit: 8, null: false
    t.integer  "jfbc_request_id", limit: 4, null: false
    t.integer  "status",          limit: 1, null: false
    t.datetime "created",                   null: false
    t.datetime "modified",                  null: false
  end

  create_table "wlje4_jfbconnect_request", force: :cascade do |t|
    t.integer  "published",       limit: 1,   null: false
    t.string   "title",           limit: 50,  null: false
    t.string   "message",         limit: 250, null: false
    t.string   "destination_url", limit: 200, null: false
    t.string   "thanks_url",      limit: 200, null: false
    t.integer  "breakout_canvas", limit: 1,   null: false
    t.datetime "created",                     null: false
    t.datetime "modified",                    null: false
  end

  create_table "wlje4_jfbconnect_user_map", force: :cascade do |t|
    t.integer  "j_user_id",        limit: 4,                    null: false
    t.string   "provider_user_id", limit: 40
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.text     "access_token",     limit: 65535
    t.boolean  "authorized",                     default: true
    t.text     "params",           limit: 65535
    t.string   "provider",         limit: 20
  end

  create_table "wlje4_js_classified_config", force: :cascade do |t|
    t.string "categories", limit: 10, default: "0"
    t.string "locations",  limit: 10, default: "0"
  end

  add_index "wlje4_js_classified_config", ["categories"], name: "categories", unique: true, using: :btree
  add_index "wlje4_js_classified_config", ["locations"], name: "locations", unique: true, using: :btree

  create_table "wlje4_js_classified_locations", force: :cascade do |t|
    t.string "country",             limit: 23, default: "0"
    t.string "city",                limit: 23, default: "0"
    t.string "first_address_line",  limit: 50, default: ""
    t.string "second_address_line", limit: 50, default: ""
  end

  create_table "wlje4_k2_attachments", force: :cascade do |t|
    t.integer  "itemID",         limit: 4
    t.string   "filename",       limit: 255
    t.string   "title",          limit: 255
    t.text     "titleAttribute", limit: 65535
    t.string   "thumbnail",      limit: 255
    t.integer  "hits",           limit: 4
    t.string   "catid",          limit: 55
    t.integer  "userid",         limit: 4
    t.datetime "datetime"
    t.string   "uploadtype",     limit: 45
  end

  add_index "wlje4_k2_attachments", ["itemID"], name: "itemID", using: :btree

  create_table "wlje4_k2_categories", force: :cascade do |t|
    t.string  "name",             limit: 255,               null: false
    t.string  "alias",            limit: 255,               null: false
    t.text    "description",      limit: 65535
    t.integer "parent",           limit: 4,     default: 0
    t.integer "extraFieldsGroup", limit: 4,                 null: false
    t.integer "published",        limit: 2,     default: 0, null: false
    t.integer "access",           limit: 4,     default: 0, null: false
    t.integer "ordering",         limit: 4,     default: 0, null: false
    t.string  "image",            limit: 255
    t.text    "params",           limit: 65535,             null: false
    t.integer "trash",            limit: 2,     default: 0, null: false
    t.text    "plugins",          limit: 65535,             null: false
    t.string  "language",         limit: 7,                 null: false
  end

  add_index "wlje4_k2_categories", ["access"], name: "access", using: :btree
  add_index "wlje4_k2_categories", ["language"], name: "language", using: :btree
  add_index "wlje4_k2_categories", ["ordering"], name: "ordering", using: :btree
  add_index "wlje4_k2_categories", ["parent"], name: "parent", using: :btree
  add_index "wlje4_k2_categories", ["published", "access", "trash"], name: "category", using: :btree
  add_index "wlje4_k2_categories", ["published"], name: "published", using: :btree
  add_index "wlje4_k2_categories", ["trash"], name: "trash", using: :btree

  create_table "wlje4_k2_comments", force: :cascade do |t|
    t.integer  "itemID",       limit: 4,                 null: false
    t.integer  "userID",       limit: 4,                 null: false
    t.string   "userName",     limit: 255,               null: false
    t.datetime "commentDate",                            null: false
    t.text     "commentText",  limit: 65535,             null: false
    t.string   "commentEmail", limit: 255,               null: false
    t.string   "commentURL",   limit: 255,               null: false
    t.integer  "published",    limit: 4,     default: 0, null: false
  end

  add_index "wlje4_k2_comments", ["itemID"], name: "itemID", using: :btree
  add_index "wlje4_k2_comments", ["published", "commentDate"], name: "latestComments", using: :btree
  add_index "wlje4_k2_comments", ["published"], name: "published", using: :btree
  add_index "wlje4_k2_comments", ["userID"], name: "userID", using: :btree

  create_table "wlje4_k2_extra_fields", force: :cascade do |t|
    t.string  "name",      limit: 255,   null: false
    t.text    "value",     limit: 65535, null: false
    t.string  "type",      limit: 255,   null: false
    t.integer "group",     limit: 4,     null: false
    t.integer "published", limit: 1,     null: false
    t.integer "ordering",  limit: 4,     null: false
  end

  add_index "wlje4_k2_extra_fields", ["group"], name: "group", using: :btree
  add_index "wlje4_k2_extra_fields", ["ordering"], name: "ordering", using: :btree
  add_index "wlje4_k2_extra_fields", ["published"], name: "published", using: :btree

  create_table "wlje4_k2_extra_fields_groups", force: :cascade do |t|
    t.string "name", limit: 255, null: false
  end

  create_table "wlje4_k2_extra_fields_index", force: :cascade do |t|
    t.integer "k2_item_id",                   limit: 4,          default: 0
    t.string  "item_title",                   limit: 255,        default: "0"
    t.integer "extrafield_id",                limit: 4,          default: 0
    t.string  "extrafield_name",              limit: 255,        default: "0"
    t.string  "extrafield_value",             limit: 255,        default: "0"
    t.text    "extrafield_keyword",           limit: 4294967295
    t.string  "extrafield_gradelevel",        limit: 255,        default: "0"
    t.string  "extrafield_region",            limit: 255,        default: "0"
    t.string  "extrafield_subject",           limit: 255,        default: "0"
    t.string  "extrafield_author",            limit: 255,        default: "0"
    t.string  "extrafield_language",          limit: 255,        default: "0"
    t.string  "extrafield_resourcetype",      limit: 255,        default: "0"
    t.string  "extrafield_globaltopic",       limit: 255,        default: "0"
    t.string  "extrafield_length",            limit: 255,        default: "0"
    t.text    "extrafield_materials",         limit: 4294967295
    t.text    "extrafield_ask",               limit: 4294967295
    t.text    "extrafield_activate",          limit: 4294967295
    t.text    "extrafield_investigate",       limit: 4294967295
    t.text    "extrafield_synthesize",        limit: 4294967295
    t.text    "extrafield_share",             limit: 4294967295
    t.text    "extrafield_reflect",           limit: 4294967295
    t.text    "extrafield_assess",            limit: 4294967295
    t.text    "extrafield_extend",            limit: 4294967295
    t.binary  "extrafield_web_print",         limit: 4294967295
    t.text    "extrafield_standards",         limit: 4294967295
    t.text    "extrafield_reflection",        limit: 4294967295
    t.text    "extrafield_attachments",       limit: 4294967295
    t.string  "extrafield_school",            limit: 255,        default: "0"
    t.string  "extrafield_district",          limit: 255,        default: "0"
    t.string  "extrafield_connection",        limit: 255,        default: "0"
    t.string  "extrafield_moduleid",          limit: 255,        default: "0"
    t.string  "extrafield_revision_status",   limit: 255,        default: "0"
    t.string  "extrafield_unit",              limit: 255,        default: "0"
    t.string  "extrafield_unit_lesson_plans", limit: 255,        default: "0"
    t.string  "extrafield_activities",        limit: 255,        default: "0"
    t.string  "extrafield_capstone",          limit: 255,        default: "0"
    t.string  "extrafield_competence",        limit: 255,        default: "0"
    t.text    "extrafield_tags",              limit: 4294967295
  end

  add_index "wlje4_k2_extra_fields_index", ["k2_item_id"], name: "idx_wlje4_k2_extra_fields_index_k2_item_id", unique: true, using: :btree

  create_table "wlje4_k2_extra_fields_mapping", primary_key: "map_id", force: :cascade do |t|
    t.integer "extra_field_id",       limit: 4
    t.text    "extra_field_name",     limit: 65535
    t.text    "group_type",           limit: 65535
    t.text    "extra_field_option1",  limit: 65535
    t.text    "extra_field_option2",  limit: 65535
    t.text    "extra_field_option3",  limit: 65535
    t.text    "extra_field_option4",  limit: 65535
    t.text    "extra_field_option5",  limit: 65535
    t.text    "extra_field_option6",  limit: 65535
    t.text    "extra_field_option7",  limit: 65535
    t.text    "extra_field_option8",  limit: 65535
    t.text    "extra_field_option9",  limit: 65535
    t.text    "extra_field_option10", limit: 65535
    t.text    "extra_field_option11", limit: 65535
    t.text    "extra_field_option12", limit: 65535
    t.text    "extra_field_option13", limit: 65535
    t.text    "extra_field_option14", limit: 65535
    t.text    "extra_field_option15", limit: 65535
    t.text    "extra_field_option16", limit: 65535
    t.text    "extra_field_option17", limit: 65535
    t.text    "extra_field_option18", limit: 65535
    t.text    "extra_field_option19", limit: 65535
    t.text    "extra_field_option20", limit: 65535
  end

  create_table "wlje4_k2_itemid_associations", force: :cascade do |t|
    t.integer  "k2itemid",              limit: 4
    t.integer  "badgeid",               limit: 4
    t.integer  "userid",                limit: 4
    t.integer  "catid",                 limit: 4
    t.string   "status",                limit: 20
    t.text     "formurl",               limit: 65535
    t.datetime "date_created"
    t.datetime "date_edited"
    t.datetime "date_attached"
    t.datetime "date_revised"
    t.string   "user_school",           limit: 255
    t.string   "user_district",         limit: 255
    t.integer  "badge_assertion_id",    limit: 4
    t.string   "sf_ext_id",             limit: 45
    t.datetime "last_modified"
    t.string   "concat_badgeid_userid", limit: 45
  end

  add_index "wlje4_k2_itemid_associations", ["badge_assertion_id"], name: "badge_assertion_id_index", using: :btree
  add_index "wlje4_k2_itemid_associations", ["userid", "catid"], name: "one_peruser_percatid", unique: true, using: :btree

  create_table "wlje4_k2_items", force: :cascade do |t|
    t.string   "title",               limit: 255,                                        null: false
    t.string   "alias",               limit: 87,                                         null: false
    t.integer  "created_by",          limit: 4
    t.string   "moduletype",          limit: 50
    t.integer  "catid",               limit: 4
    t.integer  "published",           limit: 4
    t.text     "introtext",           limit: 65535
    t.text     "fulltext",            limit: 4294967295
    t.string   "video",               limit: 50
    t.string   "gallery",             limit: 50
    t.text     "extra_fields",        limit: 4294967295
    t.text     "extra_fields_search", limit: 4294967295
    t.datetime "created"
    t.string   "created_by_alias",    limit: 50
    t.integer  "checked_out",         limit: 4
    t.datetime "checked_out_time"
    t.datetime "modified"
    t.string   "modified_by",         limit: 50
    t.datetime "publish_up"
    t.datetime "publish_down",                           default: '2080-01-01 01:00:00'
    t.integer  "trash",               limit: 4,          default: 0
    t.integer  "access",              limit: 4
    t.integer  "ordering",            limit: 4
    t.string   "featured",            limit: 50
    t.string   "featured_ordering",   limit: 50
    t.string   "image_caption",       limit: 50
    t.string   "image_credits",       limit: 50
    t.string   "video_caption",       limit: 50
    t.string   "video_credits",       limit: 50
    t.integer  "hits",                limit: 4,          default: 1
    t.string   "params",              limit: 255
    t.string   "metadesc",            limit: 238
    t.string   "metadata",            limit: 50
    t.string   "metakey",             limit: 50
    t.string   "plugins",             limit: 50
    t.string   "language",            limit: 50
    t.integer  "badge",               limit: 4
    t.string   "userid_catid",        limit: 45
    t.integer  "rating_sum",          limit: 4,          default: 0
    t.integer  "rating_count",        limit: 4,          default: 0
    t.integer  "vif_other",           limit: 4,          default: 1
  end

  add_index "wlje4_k2_items", ["catid"], name: "catid", using: :btree
  add_index "wlje4_k2_items", ["created"], name: "created", using: :btree
  add_index "wlje4_k2_items", ["created_by", "catid", "alias"], name: "onecatidperperson", unique: true, using: :btree
  add_index "wlje4_k2_items", ["created_by"], name: "created_by", using: :btree
  add_index "wlje4_k2_items", ["featured"], name: "featured", using: :btree
  add_index "wlje4_k2_items", ["featured_ordering"], name: "featured_ordering", using: :btree
  add_index "wlje4_k2_items", ["hits"], name: "hits", using: :btree
  add_index "wlje4_k2_items", ["language"], name: "language", using: :btree
  add_index "wlje4_k2_items", ["ordering"], name: "ordering", using: :btree
  add_index "wlje4_k2_items", ["published", "publish_up", "publish_down", "trash", "access"], name: "item", using: :btree

  create_table "wlje4_k2_matching_custom_table", primary_key: "catid", force: :cascade do |t|
    t.integer "module_id",                 limit: 4
    t.string  "subid",                     limit: 50
    t.integer "badgeid",                   limit: 4
    t.integer "yearbadgeid",               limit: 4
    t.string  "pd_module",                 limit: 255
    t.integer "ref_catid",                 limit: 4
    t.integer "lp_formid",                 limit: 4
    t.integer "attach_formid",             limit: 4
    t.integer "reflection_formid",         limit: 4
    t.string  "module_key",                limit: 50
    t.string  "lp_form_menu",              limit: 64
    t.string  "lp_reflection_menu",        limit: 51
    t.string  "lp_attachments_menu",       limit: 57
    t.string  "year",                      limit: 50
    t.string  "badgeurl",                  limit: 255
    t.string  "badgetype",                 limit: 50
    t.integer "additional_criteria_catid", limit: 4
    t.string  "conf_page",                 limit: 255
    t.string  "module_name",               limit: 255
    t.string  "badge_image",               limit: 255
    t.string  "form_type",                 limit: 45
    t.string  "create_conf_page",          limit: 255
    t.string  "share_conf_page",           limit: 255
    t.string  "revise_conf_page",          limit: 255
  end

  create_table "wlje4_k2_rating", primary_key: "itemID", force: :cascade do |t|
    t.integer "rating_sum",   limit: 4,  default: 0,  null: false
    t.integer "rating_count", limit: 4,  default: 0,  null: false
    t.string  "lastip",       limit: 50, default: "", null: false
  end

  create_table "wlje4_k2_search_tally", primary_key: "search_id", force: :cascade do |t|
    t.integer  "k2_item_id",       limit: 4,     null: false
    t.text     "add_status",       limit: 65535
    t.datetime "datetime_updated"
  end

  add_index "wlje4_k2_search_tally", ["k2_item_id"], name: "unique_k2_id", unique: true, using: :btree

  create_table "wlje4_k2_tags", force: :cascade do |t|
    t.string  "name",      limit: 255,             null: false
    t.integer "published", limit: 2,   default: 0, null: false
  end

  add_index "wlje4_k2_tags", ["published"], name: "published", using: :btree

  create_table "wlje4_k2_tags_xref", force: :cascade do |t|
    t.integer "tagID",  limit: 4, null: false
    t.integer "itemID", limit: 4, null: false
  end

  add_index "wlje4_k2_tags_xref", ["itemID"], name: "itemID", using: :btree
  add_index "wlje4_k2_tags_xref", ["tagID", "itemID"], name: "single_instance_keyword_per_k2item", unique: true, using: :btree
  add_index "wlje4_k2_tags_xref", ["tagID"], name: "tagID", using: :btree

  create_table "wlje4_k2_user_groups", force: :cascade do |t|
    t.string "name",        limit: 255,   null: false
    t.text   "permissions", limit: 65535, null: false
  end

  create_table "wlje4_k2_users", force: :cascade do |t|
    t.integer "userID",      limit: 4,                   null: false
    t.string  "userName",    limit: 255
    t.string  "gender",      limit: 1,     default: "m", null: false
    t.text    "description", limit: 65535,               null: false
    t.string  "image",       limit: 255
    t.string  "url",         limit: 255
    t.integer "group",       limit: 4,     default: 0,   null: false
    t.text    "plugins",     limit: 65535,               null: false
    t.string  "ip",          limit: 15,                  null: false
    t.string  "hostname",    limit: 255,                 null: false
    t.text    "notes",       limit: 65535,               null: false
  end

  add_index "wlje4_k2_users", ["group"], name: "group", using: :btree
  add_index "wlje4_k2_users", ["userID"], name: "userID", using: :btree

  create_table "wlje4_komento_acl", force: :cascade do |t|
    t.string "cid",       limit: 255,   null: false
    t.string "component", limit: 255,   null: false
    t.string "type",      limit: 255,   null: false
    t.text   "rules",     limit: 65535, null: false
  end

  add_index "wlje4_komento_acl", ["type"], name: "komento_acl_content_type", using: :btree

  create_table "wlje4_komento_actions", force: :cascade do |t|
    t.string   "type",       limit: 20,             null: false
    t.integer  "comment_id", limit: 8,              null: false
    t.integer  "action_by",  limit: 8,  default: 0, null: false
    t.datetime "actioned",                          null: false
  end

  add_index "wlje4_komento_actions", ["comment_id"], name: "komento_actions_comment_id", using: :btree
  add_index "wlje4_komento_actions", ["type", "comment_id", "action_by"], name: "komento_actions", using: :btree

  create_table "wlje4_komento_activities", force: :cascade do |t|
    t.string   "type",       limit: 20, null: false
    t.integer  "comment_id", limit: 8,  null: false
    t.integer  "uid",        limit: 8,  null: false
    t.datetime "created",               null: false
    t.boolean  "published",             null: false
  end

  create_table "wlje4_komento_captcha", force: :cascade do |t|
    t.string   "response", limit: 5, null: false
    t.datetime "created",            null: false
  end

  create_table "wlje4_komento_comments", force: :cascade do |t|
    t.string   "component",    limit: 255,                   null: false
    t.integer  "cid",          limit: 8,                     null: false
    t.text     "comment",      limit: 65535
    t.string   "name",         limit: 255,                   null: false
    t.string   "title",        limit: 255,                   null: false
    t.string   "email",        limit: 255,   default: ""
    t.string   "url",          limit: 255,   default: ""
    t.string   "ip",           limit: 255,   default: ""
    t.integer  "created_by",   limit: 8,     default: 0
    t.datetime "created",                                    null: false
    t.integer  "modified_by",  limit: 8,     default: 0
    t.datetime "modified"
    t.integer  "deleted_by",   limit: 8,     default: 0
    t.datetime "deleted"
    t.boolean  "flag",                       default: false
    t.boolean  "published",                  default: false, null: false
    t.datetime "publish_up"
    t.datetime "publish_down"
    t.boolean  "sticked",                    default: false, null: false
    t.boolean  "sent",                       default: false
    t.integer  "parent_id",    limit: 4,     default: 0
    t.integer  "lft",          limit: 4,     default: 0,     null: false
    t.integer  "rgt",          limit: 4,     default: 0,     null: false
    t.integer  "depth",        limit: 4,     default: 0,     null: false
    t.string   "latitude",     limit: 255
    t.string   "longitude",    limit: 255
    t.text     "address",      limit: 65535
    t.text     "params",       limit: 65535
  end

  add_index "wlje4_komento_comments", ["component", "cid", "published", "created"], name: "komento_module_comments", using: :btree
  add_index "wlje4_komento_comments", ["component", "cid", "published", "lft", "rgt"], name: "komento_threaded", using: :btree
  add_index "wlje4_komento_comments", ["component", "cid", "published", "rgt"], name: "komento_threaded_reverse", using: :btree
  add_index "wlje4_komento_comments", ["parent_id", "created"], name: "komento_backend", using: :btree

  create_table "wlje4_komento_configs", id: false, force: :cascade do |t|
    t.string "component", limit: 255,   null: false
    t.text   "params",    limit: 65535, null: false
  end

  create_table "wlje4_komento_hashkeys", force: :cascade do |t|
    t.integer "uid",   limit: 8,                     null: false
    t.string  "type",  limit: 255,                   null: false
    t.boolean "state",               default: false, null: false
    t.text    "key",   limit: 65535,                 null: false
  end

  add_index "wlje4_komento_hashkeys", ["type"], name: "type", using: :btree
  add_index "wlje4_komento_hashkeys", ["uid"], name: "uid", using: :btree

  create_table "wlje4_komento_ipfilter", force: :cascade do |t|
    t.string "component", limit: 255,   null: false
    t.string "ip",        limit: 20,    null: false
    t.text   "rules",     limit: 65535, null: false
  end

  add_index "wlje4_komento_ipfilter", ["component", "ip"], name: "komento_ipfilter", using: :btree

  create_table "wlje4_komento_mailq", force: :cascade do |t|
    t.string   "mailfrom",  limit: 255
    t.string   "fromname",  limit: 255
    t.string   "recipient", limit: 255,                    null: false
    t.text     "subject",   limit: 65535,                  null: false
    t.text     "body",      limit: 65535,                  null: false
    t.datetime "created",                                  null: false
    t.string   "type",      limit: 10,    default: "text", null: false
    t.boolean  "status",                  default: false,  null: false
  end

  add_index "wlje4_komento_mailq", ["status"], name: "komento_mailq_status", using: :btree

  create_table "wlje4_komento_subscription", force: :cascade do |t|
    t.string   "type",      limit: 20,                  null: false
    t.string   "component", limit: 255,                 null: false
    t.integer  "cid",       limit: 8,                   null: false
    t.integer  "userid",    limit: 8,   default: 0,     null: false
    t.string   "fullname",  limit: 255,                 null: false
    t.string   "email",     limit: 255,                 null: false
    t.datetime "created",                               null: false
    t.boolean  "published",             default: false, null: false
  end

  add_index "wlje4_komento_subscription", ["type", "component", "cid"], name: "komento_subscription", using: :btree

  create_table "wlje4_komento_uploads", force: :cascade do |t|
    t.integer  "uid",        limit: 4
    t.text     "filename",   limit: 65535,             null: false
    t.text     "hashname",   limit: 65535,             null: false
    t.text     "path",       limit: 65535
    t.datetime "created",                              null: false
    t.integer  "created_by", limit: 8,     default: 0
    t.boolean  "published",                            null: false
    t.text     "mime",       limit: 65535,             null: false
    t.text     "size",       limit: 65535,             null: false
  end

  create_table "wlje4_kunena_aliases", id: false, force: :cascade do |t|
    t.string  "alias", limit: 255,             null: false
    t.string  "type",  limit: 10,              null: false
    t.string  "item",  limit: 32,              null: false
    t.integer "state", limit: 1,   default: 0, null: false
  end

  add_index "wlje4_kunena_aliases", ["alias"], name: "alias", unique: true, using: :btree
  add_index "wlje4_kunena_aliases", ["item"], name: "item", using: :btree
  add_index "wlje4_kunena_aliases", ["state"], name: "state", using: :btree
  add_index "wlje4_kunena_aliases", ["type"], name: "type", using: :btree

  create_table "wlje4_kunena_announcement", force: :cascade do |t|
    t.text     "title",        limit: 255,                   null: false
    t.integer  "created_by",   limit: 4,     default: 0,     null: false
    t.text     "sdescription", limit: 65535,                 null: false
    t.text     "description",  limit: 65535,                 null: false
    t.datetime "created",                                    null: false
    t.boolean  "published",                  default: false, null: false
    t.integer  "ordering",     limit: 1,     default: 0,     null: false
    t.boolean  "showdate",                   default: true,  null: false
  end

  create_table "wlje4_kunena_attachments", force: :cascade do |t|
    t.integer "mesid",    limit: 4,   default: 0, null: false
    t.integer "userid",   limit: 4,   default: 0, null: false
    t.string  "hash",     limit: 32
    t.integer "size",     limit: 4
    t.string  "folder",   limit: 255,             null: false
    t.string  "filetype", limit: 20,              null: false
    t.string  "filename", limit: 255,             null: false
  end

  add_index "wlje4_kunena_attachments", ["filename"], name: "filename", using: :btree
  add_index "wlje4_kunena_attachments", ["hash"], name: "hash", using: :btree
  add_index "wlje4_kunena_attachments", ["mesid"], name: "mesid", using: :btree
  add_index "wlje4_kunena_attachments", ["userid"], name: "userid", using: :btree

  create_table "wlje4_kunena_categories", force: :cascade do |t|
    t.integer  "parent_id",        limit: 4,     default: 0
    t.text     "name",             limit: 255
    t.string   "alias",            limit: 255,                            null: false
    t.integer  "icon_id",          limit: 1,     default: 0,              null: false
    t.integer  "locked",           limit: 1,     default: 0,              null: false
    t.string   "accesstype",       limit: 20,    default: "joomla.level", null: false
    t.integer  "access",           limit: 4,     default: 0,              null: false
    t.integer  "pub_access",       limit: 4,     default: 1,              null: false
    t.integer  "pub_recurse",      limit: 1,     default: 1
    t.integer  "admin_access",     limit: 4,     default: 0,              null: false
    t.integer  "admin_recurse",    limit: 1,     default: 1
    t.integer  "ordering",         limit: 2,     default: 0,              null: false
    t.integer  "published",        limit: 1,     default: 0,              null: false
    t.text     "channels",         limit: 65535
    t.integer  "checked_out",      limit: 1,     default: 0,              null: false
    t.datetime "checked_out_time",                                        null: false
    t.integer  "review",           limit: 1,     default: 0,              null: false
    t.integer  "allow_anonymous",  limit: 1,     default: 0,              null: false
    t.integer  "post_anonymous",   limit: 1,     default: 0,              null: false
    t.integer  "hits",             limit: 4,     default: 0,              null: false
    t.text     "description",      limit: 65535,                          null: false
    t.text     "headerdesc",       limit: 65535,                          null: false
    t.string   "class_sfx",        limit: 20,                             null: false
    t.integer  "allow_polls",      limit: 1,     default: 0,              null: false
    t.string   "topic_ordering",   limit: 16,    default: "lastpost",     null: false
    t.integer  "numTopics",        limit: 3,     default: 0,              null: false
    t.integer  "numPosts",         limit: 3,     default: 0,              null: false
    t.integer  "last_topic_id",    limit: 4,     default: 0,              null: false
    t.integer  "last_post_id",     limit: 4,     default: 0,              null: false
    t.integer  "last_post_time",   limit: 4,     default: 0,              null: false
    t.text     "params",           limit: 65535,                          null: false
  end

  add_index "wlje4_kunena_categories", ["accesstype", "access"], name: "category_access", using: :btree
  add_index "wlje4_kunena_categories", ["parent_id"], name: "parent_id", using: :btree
  add_index "wlje4_kunena_categories", ["published", "pub_access", "id"], name: "published_pubaccess_id", using: :btree

  create_table "wlje4_kunena_configuration", force: :cascade do |t|
    t.text "params", limit: 65535
  end

  create_table "wlje4_kunena_keywords", force: :cascade do |t|
    t.string  "name",         limit: 40, null: false
    t.integer "public_count", limit: 4,  null: false
    t.integer "total_count",  limit: 4,  null: false
  end

  add_index "wlje4_kunena_keywords", ["name"], name: "name", unique: true, using: :btree
  add_index "wlje4_kunena_keywords", ["public_count"], name: "public_count", using: :btree
  add_index "wlje4_kunena_keywords", ["total_count"], name: "total_count", using: :btree

  create_table "wlje4_kunena_keywords_map", id: false, force: :cascade do |t|
    t.integer "keyword_id", limit: 4, null: false
    t.integer "user_id",    limit: 4, null: false
    t.integer "topic_id",   limit: 4, null: false
  end

  add_index "wlje4_kunena_keywords_map", ["keyword_id", "user_id", "topic_id"], name: "keyword_user_topic", unique: true, using: :btree
  add_index "wlje4_kunena_keywords_map", ["topic_id", "user_id"], name: "topic_user", using: :btree
  add_index "wlje4_kunena_keywords_map", ["user_id"], name: "user_id", using: :btree

  create_table "wlje4_kunena_messages", force: :cascade do |t|
    t.integer "parent",          limit: 4,   default: 0
    t.integer "thread",          limit: 4,   default: 0
    t.integer "catid",           limit: 4,   default: 0, null: false
    t.text    "name",            limit: 255
    t.integer "userid",          limit: 4,   default: 0, null: false
    t.text    "email",           limit: 255
    t.text    "subject",         limit: 255
    t.integer "time",            limit: 4,   default: 0, null: false
    t.string  "ip",              limit: 128
    t.integer "topic_emoticon",  limit: 4,   default: 0, null: false
    t.integer "locked",          limit: 1,   default: 0, null: false
    t.integer "hold",            limit: 1,   default: 0, null: false
    t.integer "ordering",        limit: 4,   default: 0
    t.integer "hits",            limit: 4,   default: 0
    t.integer "moved",           limit: 1,   default: 0
    t.integer "modified_by",     limit: 4
    t.integer "modified_time",   limit: 4
    t.text    "modified_reason", limit: 255
  end

  add_index "wlje4_kunena_messages", ["catid", "parent"], name: "catid_parent", using: :btree
  add_index "wlje4_kunena_messages", ["hold", "time"], name: "hold_time", using: :btree
  add_index "wlje4_kunena_messages", ["ip"], name: "ip", using: :btree
  add_index "wlje4_kunena_messages", ["locked"], name: "locked", using: :btree
  add_index "wlje4_kunena_messages", ["parent", "hits"], name: "parent_hits", using: :btree
  add_index "wlje4_kunena_messages", ["thread"], name: "thread", using: :btree
  add_index "wlje4_kunena_messages", ["time"], name: "time", using: :btree
  add_index "wlje4_kunena_messages", ["userid"], name: "userid", using: :btree

  create_table "wlje4_kunena_messages_text", primary_key: "mesid", force: :cascade do |t|
    t.text "message", limit: 65535, null: false
  end

  create_table "wlje4_kunena_polls", force: :cascade do |t|
    t.string   "title",          limit: 100, null: false
    t.integer  "threadid",       limit: 4,   null: false
    t.datetime "polltimetolive"
  end

  add_index "wlje4_kunena_polls", ["threadid"], name: "threadid", using: :btree

  create_table "wlje4_kunena_polls_options", force: :cascade do |t|
    t.integer "pollid", limit: 4
    t.string  "text",   limit: 100
    t.integer "votes",  limit: 4
  end

  add_index "wlje4_kunena_polls_options", ["pollid"], name: "pollid", using: :btree

  create_table "wlje4_kunena_polls_users", id: false, force: :cascade do |t|
    t.integer  "pollid",   limit: 4
    t.integer  "userid",   limit: 4
    t.integer  "votes",    limit: 4
    t.datetime "lasttime",           null: false
    t.integer  "lastvote", limit: 4
  end

  add_index "wlje4_kunena_polls_users", ["pollid", "userid"], name: "pollid", unique: true, using: :btree

  create_table "wlje4_kunena_ranks", primary_key: "rank_id", force: :cascade do |t|
    t.string  "rank_title",   limit: 255, default: "",    null: false
    t.integer "rank_min",     limit: 3,   default: 0,     null: false
    t.boolean "rank_special",             default: false, null: false
    t.string  "rank_image",   limit: 255, default: "",    null: false
  end

  create_table "wlje4_kunena_sessions", primary_key: "userid", force: :cascade do |t|
    t.text    "allowed",    limit: 65535
    t.integer "lasttime",   limit: 4,     default: 0, null: false
    t.text    "readtopics", limit: 65535
    t.integer "currvisit",  limit: 4,     default: 0, null: false
  end

  add_index "wlje4_kunena_sessions", ["currvisit"], name: "currvisit", using: :btree

  create_table "wlje4_kunena_smileys", force: :cascade do |t|
    t.string  "code",         limit: 12, default: "", null: false
    t.string  "location",     limit: 50, default: "", null: false
    t.string  "greylocation", limit: 60, default: "", null: false
    t.integer "emoticonbar",  limit: 1,  default: 0,  null: false
  end

  create_table "wlje4_kunena_thankyou", id: false, force: :cascade do |t|
    t.integer  "postid",       limit: 4, null: false
    t.integer  "userid",       limit: 4, null: false
    t.integer  "targetuserid", limit: 4, null: false
    t.datetime "time",                   null: false
  end

  add_index "wlje4_kunena_thankyou", ["postid", "userid"], name: "postid", unique: true, using: :btree
  add_index "wlje4_kunena_thankyou", ["targetuserid"], name: "targetuserid", using: :btree
  add_index "wlje4_kunena_thankyou", ["userid"], name: "userid", using: :btree

  create_table "wlje4_kunena_topics", force: :cascade do |t|
    t.integer "category_id",           limit: 4,     default: 0, null: false
    t.text    "subject",               limit: 255
    t.integer "icon_id",               limit: 4,     default: 0, null: false
    t.integer "locked",                limit: 1,     default: 0, null: false
    t.integer "hold",                  limit: 1,     default: 0, null: false
    t.integer "ordering",              limit: 4,     default: 0, null: false
    t.integer "posts",                 limit: 4,     default: 0, null: false
    t.integer "hits",                  limit: 4,     default: 0, null: false
    t.integer "attachments",           limit: 4,     default: 0, null: false
    t.integer "poll_id",               limit: 4,     default: 0, null: false
    t.integer "moved_id",              limit: 4,     default: 0, null: false
    t.integer "first_post_id",         limit: 4,     default: 0, null: false
    t.integer "first_post_time",       limit: 4,     default: 0, null: false
    t.integer "first_post_userid",     limit: 4,     default: 0, null: false
    t.text    "first_post_message",    limit: 65535
    t.text    "first_post_guest_name", limit: 255
    t.integer "last_post_id",          limit: 4,     default: 0, null: false
    t.integer "last_post_time",        limit: 4,     default: 0, null: false
    t.integer "last_post_userid",      limit: 4,     default: 0, null: false
    t.text    "last_post_message",     limit: 65535
    t.text    "last_post_guest_name",  limit: 255
    t.text    "params",                limit: 65535,             null: false
  end

  add_index "wlje4_kunena_topics", ["category_id"], name: "category_id", using: :btree
  add_index "wlje4_kunena_topics", ["first_post_time"], name: "first_post_time", using: :btree
  add_index "wlje4_kunena_topics", ["first_post_userid"], name: "first_post_userid", using: :btree
  add_index "wlje4_kunena_topics", ["hits"], name: "hits", using: :btree
  add_index "wlje4_kunena_topics", ["hold"], name: "hold", using: :btree
  add_index "wlje4_kunena_topics", ["last_post_time"], name: "last_post_time", using: :btree
  add_index "wlje4_kunena_topics", ["last_post_userid"], name: "last_post_userid", using: :btree
  add_index "wlje4_kunena_topics", ["locked"], name: "locked", using: :btree
  add_index "wlje4_kunena_topics", ["posts"], name: "posts", using: :btree

  create_table "wlje4_kunena_user_categories", id: false, force: :cascade do |t|
    t.integer  "user_id",     limit: 4,                 null: false
    t.integer  "category_id", limit: 4,                 null: false
    t.integer  "role",        limit: 1,     default: 0, null: false
    t.datetime "allreadtime"
    t.integer  "subscribed",  limit: 1,     default: 0, null: false
    t.text     "params",      limit: 65535,             null: false
  end

  add_index "wlje4_kunena_user_categories", ["category_id", "subscribed"], name: "category_subscribed", using: :btree
  add_index "wlje4_kunena_user_categories", ["role"], name: "role", using: :btree

  create_table "wlje4_kunena_user_read", id: false, force: :cascade do |t|
    t.integer "user_id",     limit: 4, null: false
    t.integer "topic_id",    limit: 4, null: false
    t.integer "category_id", limit: 4, null: false
    t.integer "message_id",  limit: 4, null: false
    t.integer "time",        limit: 4, null: false
  end

  add_index "wlje4_kunena_user_read", ["category_id", "user_id"], name: "category_user_id", using: :btree
  add_index "wlje4_kunena_user_read", ["time"], name: "time", using: :btree
  add_index "wlje4_kunena_user_read", ["user_id", "topic_id"], name: "user_topic_id", unique: true, using: :btree

  create_table "wlje4_kunena_user_topics", id: false, force: :cascade do |t|
    t.integer "user_id",      limit: 4,     default: 0, null: false
    t.integer "topic_id",     limit: 4,     default: 0, null: false
    t.integer "category_id",  limit: 4,                 null: false
    t.integer "posts",        limit: 3,     default: 0, null: false
    t.integer "last_post_id", limit: 4,     default: 0, null: false
    t.integer "owner",        limit: 1,     default: 0, null: false
    t.integer "favorite",     limit: 1,     default: 0, null: false
    t.integer "subscribed",   limit: 1,     default: 0, null: false
    t.text    "params",       limit: 65535,             null: false
  end

  add_index "wlje4_kunena_user_topics", ["favorite"], name: "favorite", using: :btree
  add_index "wlje4_kunena_user_topics", ["owner"], name: "owner", using: :btree
  add_index "wlje4_kunena_user_topics", ["posts"], name: "posts", using: :btree
  add_index "wlje4_kunena_user_topics", ["subscribed"], name: "subscribed", using: :btree
  add_index "wlje4_kunena_user_topics", ["topic_id"], name: "topic_id", using: :btree
  add_index "wlje4_kunena_user_topics", ["user_id", "topic_id"], name: "user_topic_id", unique: true, using: :btree

  create_table "wlje4_kunena_users", primary_key: "userid", force: :cascade do |t|
    t.string   "view",         limit: 8,     default: "",           null: false
    t.text     "signature",    limit: 65535
    t.integer  "moderator",    limit: 4,     default: 0
    t.datetime "banned"
    t.integer  "ordering",     limit: 4,     default: 0
    t.integer  "posts",        limit: 4,     default: 0
    t.string   "avatar",       limit: 255
    t.integer  "karma",        limit: 4,     default: 0
    t.integer  "karma_time",   limit: 4,     default: 0
    t.integer  "group_id",     limit: 4,     default: 1
    t.integer  "uhits",        limit: 4,     default: 0
    t.text     "personalText", limit: 255
    t.integer  "gender",       limit: 1,     default: 0,            null: false
    t.date     "birthdate",                  default: '0001-01-01', null: false
    t.string   "location",     limit: 50
    t.string   "icq",          limit: 50
    t.string   "aim",          limit: 50
    t.string   "yim",          limit: 50
    t.string   "msn",          limit: 50
    t.string   "skype",        limit: 50
    t.string   "twitter",      limit: 50
    t.string   "facebook",     limit: 50
    t.string   "gtalk",        limit: 50
    t.string   "myspace",      limit: 50
    t.string   "linkedin",     limit: 50
    t.string   "delicious",    limit: 50
    t.string   "friendfeed",   limit: 50
    t.string   "digg",         limit: 50
    t.string   "blogspot",     limit: 50
    t.string   "flickr",       limit: 50
    t.string   "bebo",         limit: 50
    t.string   "websitename",  limit: 50
    t.string   "websiteurl",   limit: 50
    t.integer  "rank",         limit: 1,     default: 0,            null: false
    t.boolean  "hideEmail",                  default: true,         null: false
    t.boolean  "showOnline",                 default: true,         null: false
    t.integer  "thankyou",     limit: 4,     default: 0
  end

  add_index "wlje4_kunena_users", ["banned"], name: "banned", using: :btree
  add_index "wlje4_kunena_users", ["group_id"], name: "group_id", using: :btree
  add_index "wlje4_kunena_users", ["moderator"], name: "moderator", using: :btree
  add_index "wlje4_kunena_users", ["posts"], name: "posts", using: :btree
  add_index "wlje4_kunena_users", ["uhits"], name: "uhits", using: :btree

  create_table "wlje4_kunena_users_banned", force: :cascade do |t|
    t.integer  "userid",         limit: 4
    t.string   "ip",             limit: 128
    t.integer  "blocked",        limit: 1,     default: 0, null: false
    t.datetime "expiration"
    t.integer  "created_by",     limit: 4,                 null: false
    t.datetime "created_time",                             null: false
    t.text     "reason_private", limit: 65535
    t.text     "reason_public",  limit: 65535
    t.integer  "modified_by",    limit: 4
    t.datetime "modified_time"
    t.text     "comments",       limit: 65535
    t.text     "params",         limit: 65535
  end

  add_index "wlje4_kunena_users_banned", ["created_time"], name: "created_time", using: :btree
  add_index "wlje4_kunena_users_banned", ["expiration"], name: "expiration", using: :btree
  add_index "wlje4_kunena_users_banned", ["ip"], name: "ip", using: :btree
  add_index "wlje4_kunena_users_banned", ["userid"], name: "userid", using: :btree

  create_table "wlje4_kunena_version", force: :cascade do |t|
    t.string "version",     limit: 20,    null: false
    t.date   "versiondate",               null: false
    t.date   "installdate",               null: false
    t.string "build",       limit: 20,    null: false
    t.string "versionname", limit: 40
    t.text   "state",       limit: 65535, null: false
  end

  create_table "wlje4_languages", primary_key: "lang_id", force: :cascade do |t|
    t.string  "lang_code",    limit: 7,                  null: false
    t.string  "title",        limit: 50,                 null: false
    t.string  "title_native", limit: 50,                 null: false
    t.string  "sef",          limit: 50,                 null: false
    t.string  "image",        limit: 50,                 null: false
    t.string  "description",  limit: 512,                null: false
    t.text    "metakey",      limit: 65535,              null: false
    t.text    "metadesc",     limit: 65535,              null: false
    t.string  "sitename",     limit: 1024,  default: "", null: false
    t.integer "published",    limit: 4,     default: 0,  null: false
    t.integer "access",       limit: 4,     default: 0,  null: false
    t.integer "ordering",     limit: 4,     default: 0,  null: false
  end

  add_index "wlje4_languages", ["access"], name: "idx_access", using: :btree
  add_index "wlje4_languages", ["image"], name: "idx_image", unique: true, using: :btree
  add_index "wlje4_languages", ["lang_code"], name: "idx_langcode", unique: true, using: :btree
  add_index "wlje4_languages", ["ordering"], name: "idx_ordering", using: :btree
  add_index "wlje4_languages", ["sef"], name: "idx_sef", unique: true, using: :btree

  create_table "wlje4_listbingo_addons", force: :cascade do |t|
    t.string   "name",             limit: 100,               null: false
    t.string   "type",             limit: 20,                null: false
    t.string   "element",          limit: 100,               null: false
    t.string   "folder",           limit: 100,               null: false
    t.integer  "client_id",        limit: 1,                 null: false
    t.integer  "published",        limit: 1,     default: 1, null: false
    t.integer  "access",           limit: 1,     default: 1, null: false
    t.integer  "protected",        limit: 1,     default: 0, null: false
    t.text     "manifest_cache",   limit: 65535,             null: false
    t.text     "params",           limit: 65535,             null: false
    t.text     "custom_data",      limit: 65535,             null: false
    t.text     "system_data",      limit: 65535,             null: false
    t.integer  "checked_out",      limit: 4,     default: 0, null: false
    t.datetime "checked_out_time",                           null: false
    t.integer  "ordering",         limit: 4,     default: 0
    t.integer  "state",            limit: 4,     default: 0
    t.string   "author",           limit: 255,               null: false
    t.string   "version",          limit: 255,               null: false
  end

  create_table "wlje4_listbingo_categories", force: :cascade do |t|
    t.string   "title",            limit: 255,                                                 null: false
    t.string   "alias",            limit: 255,                                                 null: false
    t.string   "logo",             limit: 255
    t.text     "description",      limit: 4294967295
    t.integer  "parent_id",        limit: 4,                                   default: 0
    t.string   "profile",          limit: 255,                                                 null: false
    t.integer  "hasprice",         limit: 1
    t.integer  "priceable",        limit: 1
    t.decimal  "price",                               precision: 15, scale: 5
    t.string   "currency",         limit: 16
    t.string   "currency_symbol",  limit: 8
    t.integer  "access",           limit: 1
    t.integer  "ordering",         limit: 4
    t.integer  "published",        limit: 1
    t.integer  "level",            limit: 4,                                   default: 0,     null: false
    t.text     "rel_cats",         limit: 65535,                                               null: false
    t.text     "cats_path",        limit: 65535,                                               null: false
    t.boolean  "last_cat",                                                     default: false, null: false
    t.integer  "checked_out",      limit: 4,                                   default: 0,     null: false
    t.datetime "checked_out_time",                                                             null: false
  end

  add_index "wlje4_listbingo_categories", ["parent_id"], name: "parent_id", using: :btree

  create_table "wlje4_listbingo_conditions", force: :cascade do |t|
    t.string   "title",            limit: 255,               null: false
    t.string   "alias",            limit: 255,               null: false
    t.text     "description",      limit: 65535,             null: false
    t.string   "image",            limit: 255,               null: false
    t.integer  "access",           limit: 1,                 null: false
    t.integer  "published",        limit: 1,                 null: false
    t.integer  "searchable",       limit: 1,                 null: false
    t.integer  "ordering",         limit: 4,                 null: false
    t.text     "categories",       limit: 65535,             null: false
    t.integer  "checked_out",      limit: 4,     default: 0, null: false
    t.datetime "checked_out_time",                           null: false
  end

  create_table "wlje4_listbingo_countries", id: false, force: :cascade do |t|
    t.integer  "id",                limit: 8,                     null: false
    t.string   "title",             limit: 50
    t.string   "alias",             limit: 255,                   null: false
    t.string   "code",              limit: 2
    t.integer  "zip_code",          limit: 4
    t.boolean  "published",                       default: false
    t.integer  "ordering",          limit: 4
    t.text     "description",       limit: 65535
    t.string   "logo",              limit: 255
    t.integer  "default_country",   limit: 1
    t.string   "currency",          limit: 100
    t.string   "currency_symbol",   limit: 10
    t.string   "currency_format",   limit: 32
    t.string   "decimals",          limit: 5
    t.string   "decimal_separator", limit: 8
    t.string   "value_separator",   limit: 8
    t.integer  "checked_out",       limit: 4,     default: 0,     null: false
    t.datetime "checked_out_time",                                null: false
  end

  add_index "wlje4_listbingo_countries", ["id"], name: "listbingo_country_id", unique: true, using: :btree

  create_table "wlje4_listbingo_crontrackers", force: :cascade do |t|
    t.datetime "lastrun",                 null: false
    t.string   "scope",       limit: 50
    t.integer  "lastrunid",   limit: 4,   null: false
    t.string   "trackerinfo", limit: 255
    t.string   "subscope",    limit: 255
  end

  create_table "wlje4_listbingo_extrafield_options", force: :cascade do |t|
    t.string  "title",         limit: 255, null: false
    t.string  "value",         limit: 255, null: false
    t.integer "extrafield_id", limit: 4,   null: false
    t.integer "published",     limit: 1,   null: false
    t.integer "ordering",      limit: 4,   null: false
  end

  create_table "wlje4_listbingo_extrafields", force: :cascade do |t|
    t.integer  "group_id",         limit: 4,                      null: false
    t.string   "label",            limit: 255,                    null: false
    t.string   "title",            limit: 255
    t.string   "fieldcode",        limit: 255,                    null: false
    t.string   "type",             limit: 255
    t.text     "description",      limit: 65535
    t.integer  "published",        limit: 1
    t.integer  "searchable",       limit: 1,          default: 0
    t.integer  "ordering",         limit: 4
    t.datetime "created_date"
    t.integer  "required",         limit: 1,          default: 0
    t.integer  "infobar",          limit: 1,          default: 0
    t.string   "icon",             limit: 255
    t.integer  "visible_summary",  limit: 1,          default: 0
    t.integer  "visible_detail",   limit: 1,          default: 0
    t.string   "prefix_edit",      limit: 255,                    null: false
    t.string   "suffix_edit",      limit: 255,                    null: false
    t.string   "prefix_view",      limit: 255,                    null: false
    t.string   "suffix_view",      limit: 255,                    null: false
    t.integer  "access",           limit: 1
    t.text     "params",           limit: 4294967295
    t.integer  "checked_out",      limit: 4,          default: 0, null: false
    t.datetime "checked_out_time",                                null: false
    t.text     "categories",       limit: 4294967295,             null: false
    t.integer  "created_by",       limit: 4,                      null: false
  end

  create_table "wlje4_listbingo_flag_reports", force: :cascade do |t|
    t.integer  "item_id",   limit: 4
    t.string   "flag_name", limit: 255
    t.string   "name",      limit: 255,                   null: false
    t.string   "email",     limit: 255
    t.integer  "user_id",   limit: 4
    t.text     "comment",   limit: 65535
    t.datetime "flag_date"
    t.integer  "ordering",  limit: 4
    t.boolean  "approved",                default: false, null: false
  end

  add_index "wlje4_listbingo_flag_reports", ["item_id"], name: "item_id", using: :btree
  add_index "wlje4_listbingo_flag_reports", ["user_id"], name: "user_id", using: :btree

  create_table "wlje4_listbingo_groups", force: :cascade do |t|
    t.string  "title",       limit: 255
    t.string  "alias",       limit: 255
    t.text    "description", limit: 65535
    t.integer "published",   limit: 1
    t.integer "ordering",    limit: 4
    t.integer "access",      limit: 1
  end

  create_table "wlje4_listbingo_items", force: :cascade do |t|
    t.string   "global_id",          limit: 255,                                                 null: false
    t.string   "title",              limit: 255,                                                 null: false
    t.string   "alias",              limit: 255,                                                 null: false
    t.string   "currency",           limit: 255,                                                 null: false
    t.string   "currencycode",       limit: 10,                                                  null: false
    t.integer  "pricetype",          limit: 1,                                                   null: false
    t.decimal  "price",                                 precision: 15, scale: 5, default: 0.0,   null: false
    t.integer  "access",             limit: 1,                                   default: 1,     null: false
    t.integer  "prestatus",          limit: 4,                                   default: 0,     null: false
    t.integer  "status",             limit: 1,                                   default: 0,     null: false
    t.text     "description",        limit: 65535,                                               null: false
    t.integer  "category_id",        limit: 4,                                   default: 0,     null: false
    t.string   "country_code",       limit: 8,                                   default: "0",   null: false
    t.integer  "region_id",          limit: 4,                                   default: 0,     null: false
    t.integer  "user_id",            limit: 4,                                                   null: false
    t.integer  "type_id",            limit: 4,                                                   null: false
    t.integer  "condition_id",       limit: 4,                                                   null: false
    t.string   "zipcode",            limit: 20,                                                  null: false
    t.text     "address1",           limit: 65535,                                               null: false
    t.string   "address2",           limit: 255,                                                 null: false
    t.datetime "created_date",                                                                   null: false
    t.datetime "expiry_date",                                                                    null: false
    t.datetime "modified_date",                                                                  null: false
    t.integer  "show_contact",       limit: 1,                                   default: 0,     null: false
    t.integer  "views",              limit: 4,                                   default: 0,     null: false
    t.text     "itemtags",           limit: 65535,                                               null: false
    t.integer  "ordering",           limit: 4,                                                   null: false
    t.boolean  "featured",                                                       default: false, null: false
    t.integer  "badge_priority",     limit: 4,                                   default: 0,     null: false
    t.integer  "badge_id",           limit: 4,                                   default: 0,     null: false
    t.datetime "badge_start_date",                                                               null: false
    t.integer  "badge_valid_days",   limit: 4,                                                   null: false
    t.string   "image",              limit: 255,                                                 null: false
    t.text     "extrafield_values",  limit: 4294967295,                                          null: false
    t.decimal  "lat",                                   precision: 10, scale: 7,                 null: false
    t.decimal  "lng",                                   precision: 10, scale: 7,                 null: false
    t.text     "pagetitle",          limit: 65535,                                               null: false
    t.text     "metakey",            limit: 65535,                                               null: false
    t.text     "metadesc",           limit: 65535,                                               null: false
    t.integer  "enable_map",         limit: 1,                                   default: 0,     null: false
    t.boolean  "expired",                                                        default: false, null: false
    t.integer  "priceable_category", limit: 4,                                                   null: false
    t.integer  "checked_out",        limit: 4,                                   default: 0,     null: false
    t.datetime "checked_out_time",                                                               null: false
    t.string   "paid_rel_cats",      limit: 255,                                                 null: false
    t.string   "salt",               limit: 255,                                                 null: false
    t.string   "authkey",            limit: 255,                                                 null: false
    t.string   "rel_cats",           limit: 255,                                                 null: false
  end

  add_index "wlje4_listbingo_items", ["alias"], name: "alias", using: :btree
  add_index "wlje4_listbingo_items", ["badge_id"], name: "badge_id", using: :btree
  add_index "wlje4_listbingo_items", ["category_id"], name: "category_id", using: :btree
  add_index "wlje4_listbingo_items", ["condition_id"], name: "condition_id", using: :btree
  add_index "wlje4_listbingo_items", ["country_code"], name: "country_code", using: :btree
  add_index "wlje4_listbingo_items", ["currencycode"], name: "currencycode", using: :btree
  add_index "wlje4_listbingo_items", ["region_id"], name: "region_id", using: :btree
  add_index "wlje4_listbingo_items", ["status"], name: "status", using: :btree
  add_index "wlje4_listbingo_items", ["title"], name: "title", using: :btree
  add_index "wlje4_listbingo_items", ["type_id"], name: "type_id", using: :btree
  add_index "wlje4_listbingo_items", ["user_id"], name: "user_id", using: :btree

  create_table "wlje4_listbingo_itemsimages", id: false, force: :cascade do |t|
    t.integer "id",        limit: 4,                   null: false
    t.string  "caption",   limit: 255,                 null: false
    t.integer "item_id",   limit: 4
    t.boolean "primary",               default: false, null: false
    t.integer "published", limit: 1
    t.integer "ordering",  limit: 4
    t.string  "image",     limit: 255
  end

  add_index "wlje4_listbingo_itemsimages", ["id"], name: "id", using: :btree
  add_index "wlje4_listbingo_itemsimages", ["item_id"], name: "item_id", using: :btree

  create_table "wlje4_listbingo_logs", id: false, force: :cascade do |t|
    t.integer  "id",       limit: 8,     null: false
    t.text     "title",    limit: 65535, null: false
    t.datetime "logtime",                null: false
    t.integer  "user_id",  limit: 4,     null: false
    t.integer  "ref_id",   limit: 4,     null: false
    t.string   "log_type", limit: 255,   null: false
  end

  add_index "wlje4_listbingo_logs", ["id"], name: "id", unique: true, using: :btree
  add_index "wlje4_listbingo_logs", ["ref_id"], name: "ref_id", using: :btree
  add_index "wlje4_listbingo_logs", ["user_id"], name: "user_id", using: :btree

  create_table "wlje4_listbingo_mailtemplates", id: false, force: :cascade do |t|
    t.integer  "id",               limit: 8,                 null: false
    t.string   "subject",          limit: 255
    t.text     "body",             limit: 65535
    t.integer  "type",             limit: 1
    t.integer  "state",            limit: 1
    t.integer  "ordering",         limit: 4
    t.integer  "mailto",           limit: 1
    t.string   "event",            limit: 255
    t.string   "from_name",        limit: 255
    t.string   "from_email",       limit: 255
    t.string   "reply_to",         limit: 255
    t.string   "reply_to_email",   limit: 255
    t.string   "mailtogroup",      limit: 255
    t.string   "to_email",         limit: 255
    t.string   "scope",            limit: 255
    t.integer  "checked_out",      limit: 4,     default: 0, null: false
    t.datetime "checked_out_time",                           null: false
  end

  add_index "wlje4_listbingo_mailtemplates", ["id"], name: "listbingo_mailtemplate_id", unique: true, using: :btree

  create_table "wlje4_listbingo_pms_threads", id: false, force: :cascade do |t|
    t.integer  "id",           limit: 8,                     null: false
    t.integer  "item_id",      limit: 4,                     null: false
    t.text     "message",      limit: 65535,                 null: false
    t.datetime "posted_date",                                null: false
    t.string   "name",         limit: 255,                   null: false
    t.string   "email",        limit: 255,                   null: false
    t.string   "users",        limit: 255,                   null: false
    t.integer  "read",         limit: 4,     default: 0,     null: false
    t.integer  "unread",       limit: 4,                     null: false
    t.integer  "ordering",     limit: 4,                     null: false
    t.integer  "to_read",      limit: 1,     default: 0,     null: false
    t.integer  "from_read",    limit: 1,     default: 1,     null: false
    t.boolean  "guest",                                      null: false
    t.boolean  "sent_delete",                default: false, null: false
    t.boolean  "inbox_delete",                               null: false
  end

  add_index "wlje4_listbingo_pms_threads", ["id"], name: "id", unique: true, using: :btree
  add_index "wlje4_listbingo_pms_threads", ["inbox_delete"], name: "inbox_delete", using: :btree
  add_index "wlje4_listbingo_pms_threads", ["item_id"], name: "item_id", using: :btree
  add_index "wlje4_listbingo_pms_threads", ["read"], name: "read", using: :btree
  add_index "wlje4_listbingo_pms_threads", ["sent_delete"], name: "sent_delete", using: :btree
  add_index "wlje4_listbingo_pms_threads", ["unread"], name: "unread", using: :btree

  create_table "wlje4_listbingo_pms_threads_messages", id: false, force: :cascade do |t|
    t.integer  "id",           limit: 8,                 null: false
    t.integer  "thread_id",    limit: 4,                 null: false
    t.integer  "uid",          limit: 4,                 null: false
    t.text     "message",      limit: 65535,             null: false
    t.integer  "sent_delete",  limit: 4,     default: 0, null: false
    t.integer  "inbox_delete", limit: 4,     default: 0, null: false
    t.datetime "posted_date",                            null: false
  end

  add_index "wlje4_listbingo_pms_threads_messages", ["id"], name: "id", unique: true, using: :btree
  add_index "wlje4_listbingo_pms_threads_messages", ["inbox_delete"], name: "inbox_delete", using: :btree
  add_index "wlje4_listbingo_pms_threads_messages", ["sent_delete"], name: "sent_delete", using: :btree
  add_index "wlje4_listbingo_pms_threads_messages", ["thread_id"], name: "thread_id", using: :btree
  add_index "wlje4_listbingo_pms_threads_messages", ["uid"], name: "uid", using: :btree

  create_table "wlje4_listbingo_profiles", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "address1",     limit: 255
    t.string   "country_code", limit: 8
    t.integer  "region_id",    limit: 4
    t.string   "image",        limit: 255
    t.text     "preferences",  limit: 65535
    t.integer  "show_contact", limit: 1,     default: 0, null: false
    t.integer  "ordering",     limit: 4
    t.datetime "created_date"
    t.string   "phone",        limit: 255,               null: false
  end

  add_index "wlje4_listbingo_profiles", ["country_code"], name: "country_code", using: :btree
  add_index "wlje4_listbingo_profiles", ["region_id"], name: "region_id", using: :btree
  add_index "wlje4_listbingo_profiles", ["user_id"], name: "user_id", using: :btree

  create_table "wlje4_listbingo_regions", force: :cascade do |t|
    t.string   "title",             limit: 255
    t.string   "alias",             limit: 255
    t.text     "description",       limit: 65535
    t.integer  "parent_id",         limit: 4,     default: 0
    t.integer  "ordering",          limit: 4
    t.boolean  "published"
    t.string   "country_code",      limit: 8
    t.integer  "default_region",    limit: 1
    t.string   "currency_format",   limit: 32,                    null: false
    t.string   "decimals",          limit: 5,                     null: false
    t.string   "decimal_separator", limit: 8,                     null: false
    t.string   "value_separator",   limit: 8,                     null: false
    t.integer  "level",             limit: 4,     default: 0,     null: false
    t.text     "regs_path",         limit: 65535,                 null: false
    t.boolean  "last_region",                     default: false, null: false
    t.integer  "checked_out",       limit: 4,     default: 0,     null: false
    t.datetime "checked_out_time",                                null: false
  end

  add_index "wlje4_listbingo_regions", ["country_code"], name: "country_code", using: :btree
  add_index "wlje4_listbingo_regions", ["parent_id"], name: "parent_id", using: :btree

  create_table "wlje4_listbingo_statistics", force: :cascade do |t|
    t.integer "item_id", limit: 4
    t.date    "created"
  end

  add_index "wlje4_listbingo_statistics", ["item_id"], name: "item_id", using: :btree

  create_table "wlje4_listbingo_tmpimages", force: :cascade do |t|
    t.text     "image_token",     limit: 4294967295
    t.datetime "image_timestamp"
  end

  create_table "wlje4_listbingo_types", force: :cascade do |t|
    t.string   "title",            limit: 255,               null: false
    t.string   "alias",            limit: 255,               null: false
    t.text     "description",      limit: 65535,             null: false
    t.string   "image",            limit: 255,               null: false
    t.integer  "access",           limit: 1,                 null: false
    t.integer  "published",        limit: 1,                 null: false
    t.integer  "searchable",       limit: 1,                 null: false
    t.integer  "ordering",         limit: 4,                 null: false
    t.text     "categories",       limit: 65535,             null: false
    t.integer  "checked_out",      limit: 4,     default: 0, null: false
    t.datetime "checked_out_time",                           null: false
  end

  create_table "wlje4_listbingo_userposts", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "item_id",      limit: 4
    t.integer  "post_type",    limit: 1
    t.integer  "reference_id", limit: 4
    t.datetime "post_date"
  end

  add_index "wlje4_listbingo_userposts", ["item_id"], name: "item_id", using: :btree
  add_index "wlje4_listbingo_userposts", ["reference_id"], name: "reference_id", using: :btree
  add_index "wlje4_listbingo_userposts", ["user_id", "item_id"], name: "user_id", using: :btree

  create_table "wlje4_lti_consumer", primary_key: "consumer_key", force: :cascade do |t|
    t.string   "name",             limit: 45,  null: false
    t.string   "secret",           limit: 32,  null: false
    t.string   "lti_version",      limit: 12
    t.string   "consumer_name",    limit: 255
    t.string   "consumer_version", limit: 255
    t.string   "consumer_guid",    limit: 255
    t.string   "css_path",         limit: 255
    t.boolean  "protected",                    null: false
    t.boolean  "enabled",                      null: false
    t.datetime "enable_from"
    t.datetime "enable_until"
    t.date     "last_access"
    t.datetime "created",                      null: false
    t.datetime "updated",                      null: false
  end

  create_table "wlje4_lti_consumer_context", primary_key: "context_id", force: :cascade do |t|
    t.string   "lti_context_id",       limit: 255
    t.string   "lti_resource_id",      limit: 255
    t.string   "title",                limit: 255,   null: false
    t.text     "settings",             limit: 65535
    t.string   "primary_consumer_key", limit: 255
    t.string   "primary_context_id",   limit: 255
    t.boolean  "share_approved"
    t.datetime "created",                            null: false
    t.datetime "updated",                            null: false
    t.string   "context_label",        limit: 45
    t.string   "context_type",         limit: 45
  end

  add_index "wlje4_lti_consumer_context", ["primary_consumer_key", "primary_context_id"], name: "wlje4_lti_context_context_FK1", using: :btree

  create_table "wlje4_lti_consumer_v1", primary_key: "consumer_key", force: :cascade do |t|
    t.string   "name",             limit: 45,  null: false
    t.string   "secret",           limit: 32,  null: false
    t.string   "lti_version",      limit: 12
    t.string   "consumer_name",    limit: 255
    t.string   "consumer_version", limit: 255
    t.string   "consumer_guid",    limit: 255
    t.string   "css_path",         limit: 255
    t.integer  "protected",        limit: 1,   null: false
    t.integer  "enabled",          limit: 1,   null: false
    t.datetime "enable_from"
    t.datetime "enable_until"
    t.date     "last_access"
    t.datetime "created",                      null: false
    t.datetime "updated",                      null: false
  end

  create_table "wlje4_lti_consumers", primary_key: "consumer_key", force: :cascade do |t|
    t.string   "name",             limit: 45,  null: false
    t.string   "secret",           limit: 32,  null: false
    t.string   "lti_version",      limit: 12
    t.string   "consumer_name",    limit: 255
    t.string   "consumer_version", limit: 255
    t.string   "consumer_guid",    limit: 255
    t.string   "return_path",      limit: 255
    t.integer  "protected",        limit: 1,   null: false
    t.integer  "enabled",          limit: 1,   null: false
    t.datetime "enable_from"
    t.datetime "enable_until"
    t.date     "last_access"
    t.datetime "created",                      null: false
    t.datetime "updated",                      null: false
  end

  create_table "wlje4_lti_context_v1", id: false, force: :cascade do |t|
    t.string   "consumer_key",         limit: 255,   null: false
    t.string   "context_id",           limit: 255,   null: false
    t.string   "lti_context_id",       limit: 255
    t.string   "lti_resource_id",      limit: 255
    t.string   "title",                limit: 255,   null: false
    t.text     "settings",             limit: 65535
    t.string   "primary_consumer_key", limit: 255
    t.string   "primary_context_id",   limit: 255
    t.integer  "share_approved",       limit: 1
    t.datetime "created",                            null: false
    t.datetime "updated",                            null: false
  end

  add_index "wlje4_lti_context_v1", ["primary_consumer_key", "primary_context_id"], name: "wlje4_lti_context_context_FK1", using: :btree

  create_table "wlje4_lti_ims_keys", force: :cascade do |t|
    t.string   "oauth_consumer_key", limit: 255, null: false
    t.string   "secret",             limit: 255
    t.string   "name",               limit: 255
    t.string   "context_id",         limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "wlje4_lti_imskeys_v1", force: :cascade do |t|
    t.string   "name",             limit: 256,   null: false
    t.text     "description",      limit: 65535, null: false
    t.string   "oauthconsumerkey", limit: 256,   null: false
    t.string   "secret",           limit: 256,   null: false
    t.string   "contextid",        limit: 256,   null: false
    t.date     "createdat",                      null: false
    t.date     "updatedat",                      null: false
    t.integer  "checked_out",      limit: 4,     null: false
    t.datetime "checked_out_time",               null: false
  end

  create_table "wlje4_lti_nonce_v1", id: false, force: :cascade do |t|
    t.string   "consumer_key", limit: 255, null: false
    t.string   "value",        limit: 32,  null: false
    t.datetime "expires",                  null: false
  end

  create_table "wlje4_lti_share_key_v1", primary_key: "share_key_id", force: :cascade do |t|
    t.string   "primary_consumer_key", limit: 255, null: false
    t.string   "primary_context_id",   limit: 255, null: false
    t.integer  "auto_approve",         limit: 1,   null: false
    t.datetime "expires",                          null: false
  end

  add_index "wlje4_lti_share_key_v1", ["primary_consumer_key", "primary_context_id"], name: "wlje4_lti_share_key_context_FK1", using: :btree

  create_table "wlje4_lti_users", primary_key: "user_key", force: :cascade do |t|
    t.string   "consumer_key",         limit: 255, null: false
    t.string   "context_id",           limit: 255, null: false
    t.string   "user_id",              limit: 255, null: false
    t.string   "email",                limit: 45
    t.string   "lti_result_sourcedid", limit: 255, null: false
    t.datetime "created",                          null: false
    t.datetime "updated",                          null: false
  end

  add_index "wlje4_lti_users", ["user_key"], name: "user_key_UNIQUE", unique: true, using: :btree

  create_table "wlje4_menu", force: :cascade do |t|
    t.string   "menutype",          limit: 24,                 null: false
    t.string   "title",             limit: 255,                null: false
    t.string   "alias",             limit: 255,                null: false
    t.string   "note",              limit: 255,   default: "", null: false
    t.string   "path",              limit: 1024,               null: false
    t.string   "link",              limit: 1024,               null: false
    t.string   "type",              limit: 16,                 null: false
    t.integer  "published",         limit: 1,     default: 0,  null: false
    t.integer  "parent_id",         limit: 4,     default: 1,  null: false
    t.integer  "level",             limit: 4,     default: 0,  null: false
    t.integer  "component_id",      limit: 4,     default: 0,  null: false
    t.integer  "checked_out",       limit: 4,     default: 0
    t.datetime "checked_out_time",                             null: false
    t.integer  "browserNav",        limit: 1,     default: 0,  null: false
    t.integer  "access",            limit: 4,     default: 0,  null: false
    t.string   "img",               limit: 255,                null: false
    t.integer  "template_style_id", limit: 4,     default: 0,  null: false
    t.text     "params",            limit: 65535,              null: false
    t.integer  "lft",               limit: 4,     default: 0,  null: false
    t.integer  "rgt",               limit: 4,     default: 0,  null: false
    t.integer  "home",              limit: 1,     default: 0,  null: false
    t.string   "language",          limit: 7,     default: "", null: false
    t.integer  "client_id",         limit: 1,     default: 0,  null: false
  end

  add_index "wlje4_menu", ["alias"], name: "idx_alias", using: :btree
  add_index "wlje4_menu", ["client_id", "parent_id", "alias", "language"], name: "idx_client_id_parent_id_alias_language", unique: true, using: :btree
  add_index "wlje4_menu", ["component_id", "menutype", "published", "access"], name: "idx_componentid", using: :btree
  add_index "wlje4_menu", ["language"], name: "idx_language", using: :btree
  add_index "wlje4_menu", ["lft", "rgt"], name: "idx_left_right", using: :btree
  add_index "wlje4_menu", ["menutype"], name: "idx_menutype", using: :btree
  add_index "wlje4_menu", ["path"], name: "idx_path", length: {"path"=>255}, using: :btree

  create_table "wlje4_menu_easyblog_update", id: false, force: :cascade do |t|
    t.integer "id",                limit: 4
    t.string  "menutype",          limit: 50
    t.string  "title",             limit: 67
    t.string  "alias",             limit: 67
    t.string  "note",              limit: 50
    t.string  "path",              limit: 80
    t.string  "link",              limit: 78
    t.string  "type",              limit: 50
    t.integer "published",         limit: 4
    t.integer "parent_id",         limit: 4
    t.integer "level",             limit: 4
    t.integer "component_id",      limit: 4
    t.integer "checked_out",       limit: 4
    t.string  "checked_out_time",  limit: 50
    t.integer "browserNav",        limit: 4
    t.integer "access",            limit: 4
    t.string  "img",               limit: 93
    t.integer "template_style_id", limit: 4
    t.string  "params",            limit: 50
    t.integer "lft",               limit: 4
    t.integer "rgt",               limit: 4
    t.integer "home",              limit: 4
    t.string  "language",          limit: 50
    t.integer "client_id",         limit: 4
  end

  create_table "wlje4_menu_types", force: :cascade do |t|
    t.string "menutype",    limit: 24,               null: false
    t.string "title",       limit: 48,               null: false
    t.string "description", limit: 255, default: "", null: false
  end

  add_index "wlje4_menu_types", ["menutype"], name: "idx_menutype", unique: true, using: :btree

  create_table "wlje4_menus_attachments", id: false, force: :cascade do |t|
    t.integer "id",                limit: 4
    t.string  "menutype",          limit: 50
    t.string  "title",             limit: 56
    t.string  "alias",             limit: 56
    t.string  "note",              limit: 50
    t.string  "path",              limit: 56
    t.string  "link",              limit: 74
    t.string  "type",              limit: 50
    t.integer "published",         limit: 4
    t.integer "parent_id",         limit: 4
    t.integer "level",             limit: 4
    t.integer "component_id",      limit: 4
    t.integer "ordering",          limit: 4
    t.integer "checked_out",       limit: 4
    t.string  "checked_out_time",  limit: 50
    t.integer "browserNav",        limit: 4
    t.integer "access",            limit: 4
    t.string  "img",               limit: 50
    t.integer "template_style_id", limit: 4
    t.string  "params",            limit: 50
    t.integer "lft",               limit: 4
    t.integer "rgt",               limit: 4
    t.integer "home",              limit: 4
    t.string  "language",          limit: 50
    t.integer "client_id",         limit: 4
  end

  create_table "wlje4_messages", primary_key: "message_id", force: :cascade do |t|
    t.integer  "user_id_from", limit: 4,     default: 0,     null: false
    t.integer  "user_id_to",   limit: 4,     default: 0,     null: false
    t.integer  "folder_id",    limit: 1,     default: 0,     null: false
    t.datetime "date_time",                                  null: false
    t.boolean  "state",                      default: false, null: false
    t.boolean  "priority",                   default: false, null: false
    t.string   "subject",      limit: 255,   default: "",    null: false
    t.text     "message",      limit: 65535,                 null: false
  end

  add_index "wlje4_messages", ["user_id_to", "state"], name: "useridto_state", using: :btree

  create_table "wlje4_messages_cfg", id: false, force: :cascade do |t|
    t.integer "user_id",   limit: 4,   default: 0,  null: false
    t.string  "cfg_name",  limit: 100, default: "", null: false
    t.string  "cfg_value", limit: 255, default: "", null: false
  end

  add_index "wlje4_messages_cfg", ["user_id", "cfg_name"], name: "idx_user_var_name", unique: true, using: :btree

  create_table "wlje4_module_quiz_results", force: :cascade do |t|
    t.integer "userid",            limit: 4
    t.string  "module_id",         limit: 50
    t.string  "quiz_id",           limit: 50
    t.string  "q1",                limit: 50
    t.string  "q2",                limit: 50
    t.string  "q3",                limit: 50
    t.string  "q4",                limit: 50
    t.string  "q5",                limit: 50
    t.integer "score",             limit: 4
    t.string  "completion_status", limit: 50
  end

  create_table "wlje4_modules", force: :cascade do |t|
    t.integer  "asset_id",         limit: 4,     default: 0,     null: false
    t.string   "title",            limit: 100,   default: "",    null: false
    t.string   "note",             limit: 255,   default: "",    null: false
    t.text     "content",          limit: 65535,                 null: false
    t.integer  "ordering",         limit: 4,     default: 0,     null: false
    t.string   "position",         limit: 50,    default: "",    null: false
    t.integer  "checked_out",      limit: 4,     default: 0,     null: false
    t.datetime "checked_out_time",                               null: false
    t.datetime "publish_up",                                     null: false
    t.datetime "publish_down",                                   null: false
    t.boolean  "published",                      default: false, null: false
    t.string   "module",           limit: 50
    t.integer  "access",           limit: 4,     default: 0,     null: false
    t.integer  "showtitle",        limit: 1,     default: 1,     null: false
    t.text     "params",           limit: 65535,                 null: false
    t.integer  "client_id",        limit: 1,     default: 0,     null: false
    t.string   "language",         limit: 7,                     null: false
    t.string   "extra_params",     limit: 5120,  default: "",    null: false
  end

  add_index "wlje4_modules", ["language"], name: "idx_language", using: :btree
  add_index "wlje4_modules", ["module", "published"], name: "newsfeeds", using: :btree
  add_index "wlje4_modules", ["published", "access"], name: "published", using: :btree

  create_table "wlje4_modules_menu", id: false, force: :cascade do |t|
    t.integer "moduleid", limit: 4, default: 0, null: false
    t.integer "menuid",   limit: 4, default: 0, null: false
  end

  create_table "wlje4_mylessonplans", force: :cascade do |t|
    t.integer  "storage_id",       limit: 4,     default: 1,                     null: false
    t.integer  "user_id",          limit: 4,     default: 0,                     null: false
    t.datetime "created",                        default: '2013-05-14 15:32:24', null: false
    t.string   "created_by",       limit: 255,   default: "",                    null: false
    t.integer  "modified_user_id", limit: 4,     default: 0,                     null: false
    t.datetime "modified",                                                       null: false
    t.string   "modified_by",      limit: 255,   default: "",                    null: false
    t.text     "grade",            limit: 65535,                                 null: false
    t.text     "subject",          limit: 65535,                                 null: false
    t.text     "lesson_plan_name", limit: 65535,                                 null: false
    t.text     "edit",             limit: 65535
    t.text     "region",           limit: 65535,                                 null: false
    t.text     "view",             limit: 65535
    t.text     "publish",          limit: 65535
  end

  add_index "wlje4_mylessonplans", ["created"], name: "created", using: :btree
  add_index "wlje4_mylessonplans", ["modified"], name: "modified", using: :btree
  add_index "wlje4_mylessonplans", ["modified_user_id"], name: "modified_user_id", using: :btree
  add_index "wlje4_mylessonplans", ["storage_id"], name: "storage_id", using: :btree
  add_index "wlje4_mylessonplans", ["user_id"], name: "user_id", using: :btree

  create_table "wlje4_newsfeeds", force: :cascade do |t|
    t.integer  "catid",            limit: 4,     default: 0,     null: false
    t.string   "name",             limit: 100,   default: "",    null: false
    t.string   "alias",            limit: 255,   default: "",    null: false
    t.string   "link",             limit: 200,   default: "",    null: false
    t.boolean  "published",                      default: false, null: false
    t.integer  "numarticles",      limit: 4,     default: 1,     null: false
    t.integer  "cache_time",       limit: 4,     default: 3600,  null: false
    t.integer  "checked_out",      limit: 4,     default: 0,     null: false
    t.datetime "checked_out_time",                               null: false
    t.integer  "ordering",         limit: 4,     default: 0,     null: false
    t.integer  "rtl",              limit: 1,     default: 0,     null: false
    t.integer  "access",           limit: 4,     default: 0,     null: false
    t.string   "language",         limit: 7,     default: "",    null: false
    t.text     "params",           limit: 65535,                 null: false
    t.datetime "created",                                        null: false
    t.integer  "created_by",       limit: 4,     default: 0,     null: false
    t.string   "created_by_alias", limit: 255,   default: "",    null: false
    t.datetime "modified",                                       null: false
    t.integer  "modified_by",      limit: 4,     default: 0,     null: false
    t.text     "metakey",          limit: 65535,                 null: false
    t.text     "metadesc",         limit: 65535,                 null: false
    t.text     "metadata",         limit: 65535,                 null: false
    t.string   "xreference",       limit: 50,                    null: false
    t.datetime "publish_up",                                     null: false
    t.datetime "publish_down",                                   null: false
    t.text     "description",      limit: 65535,                 null: false
    t.integer  "version",          limit: 4,     default: 1,     null: false
    t.integer  "hits",             limit: 4,     default: 0,     null: false
    t.text     "images",           limit: 65535,                 null: false
  end

  add_index "wlje4_newsfeeds", ["access"], name: "idx_access", using: :btree
  add_index "wlje4_newsfeeds", ["catid"], name: "idx_catid", using: :btree
  add_index "wlje4_newsfeeds", ["checked_out"], name: "idx_checkout", using: :btree
  add_index "wlje4_newsfeeds", ["created_by"], name: "idx_createdby", using: :btree
  add_index "wlje4_newsfeeds", ["language"], name: "idx_language", using: :btree
  add_index "wlje4_newsfeeds", ["published"], name: "idx_state", using: :btree
  add_index "wlje4_newsfeeds", ["xreference"], name: "idx_xreference", using: :btree

  create_table "wlje4_offlajn_forms", force: :cascade do |t|
    t.integer  "ordering",         limit: 4,                    null: false
    t.boolean  "state",                          default: true, null: false
    t.integer  "checked_out",      limit: 4,                    null: false
    t.datetime "checked_out_time",                              null: false
    t.integer  "created_by",       limit: 4,                    null: false
    t.string   "title",            limit: 255,                  null: false
    t.string   "type",             limit: 255,                  null: false
    t.string   "theme",            limit: 255,                  null: false
    t.text     "props",            limit: 65535,                null: false
    t.text     "fields",           limit: 65535,                null: false
  end

  create_table "wlje4_offlajn_oauths", force: :cascade do |t|
    t.string  "name",       limit: 127,                 null: false
    t.string  "alias",      limit: 127,                 null: false
    t.string  "app_id",     limit: 127
    t.string  "app_secret", limit: 127
    t.boolean "published",              default: false, null: false
    t.string  "create_app", limit: 255,                 null: false
    t.string  "auth",       limit: 255,                 null: false
    t.string  "token",      limit: 255,                 null: false
    t.string  "userinfo",   limit: 255,                 null: false
  end

  create_table "wlje4_offlajn_users", primary_key: "user_id", force: :cascade do |t|
    t.string "facebook_id", limit: 255
    t.string "google_id",   limit: 255
    t.string "windows_id",  limit: 255
    t.string "twitter_id",  limit: 255
    t.string "linkedin_id", limit: 255
  end

  create_table "wlje4_oneclickaction_actions", force: :cascade do |t|
    t.integer  "userid",    limit: 8,    null: false
    t.string   "actionurl", limit: 4000, null: false
    t.string   "otp",       limit: 64,   null: false
    t.datetime "expiry",                 null: false
  end

  create_table "wlje4_opengraph_action", force: :cascade do |t|
    t.string   "plugin",       limit: 20
    t.string   "system_name",  limit: 20
    t.string   "display_name", limit: 50
    t.string   "action",       limit: 20
    t.boolean  "fb_built_in"
    t.boolean  "can_disable"
    t.text     "params",       limit: 65535
    t.boolean  "published"
    t.datetime "created"
    t.datetime "modified"
  end

  create_table "wlje4_opengraph_action_object", force: :cascade do |t|
    t.integer "object_id", limit: 4
    t.integer "action_id", limit: 4
  end

  create_table "wlje4_opengraph_activity", force: :cascade do |t|
    t.integer  "action_id",  limit: 4
    t.integer  "object_id",  limit: 4
    t.integer  "user_id",    limit: 4
    t.text     "url",        limit: 65535
    t.integer  "status",     limit: 1
    t.string   "unique_key", limit: 32
    t.text     "response",   limit: 65535
    t.datetime "created"
    t.datetime "modified"
  end

  create_table "wlje4_opengraph_object", force: :cascade do |t|
    t.string   "plugin",       limit: 15
    t.string   "system_name",  limit: 20
    t.string   "display_name", limit: 50
    t.string   "type",         limit: 20
    t.integer  "fb_built_in",  limit: 4
    t.boolean  "published"
    t.text     "params",       limit: 65535
    t.datetime "created"
    t.datetime "modified"
  end

  create_table "wlje4_overrider", force: :cascade do |t|
    t.string "constant", limit: 255,   null: false
    t.text   "string",   limit: 65535, null: false
    t.string "file",     limit: 255,   null: false
  end

  create_table "wlje4_payplans_address", primary_key: "address_id", force: :cascade do |t|
    t.integer  "user_id",       limit: 4,               null: false
    t.string   "street1",       limit: 64, default: "", null: false
    t.string   "street2",       limit: 64
    t.string   "zipcode",       limit: 10, default: "", null: false
    t.string   "city",          limit: 32, default: "", null: false
    t.string   "state",         limit: 32
    t.integer  "country_id",    limit: 4,  default: 0,  null: false
    t.integer  "zone_id",       limit: 4,  default: 0
    t.datetime "created_date",                          null: false
    t.datetime "modified_date",                         null: false
    t.integer  "is_personal",   limit: 4,  default: 1,  null: false
    t.integer  "is_buisness",   limit: 4,  default: 1,  null: false
    t.integer  "is_shipping",   limit: 4,  default: 1,  null: false
  end

  add_index "wlje4_payplans_address", ["user_id"], name: "idx_address_user_id", using: :btree

  create_table "wlje4_payplans_app", primary_key: "app_id", force: :cascade do |t|
    t.string  "title",       limit: 255,   default: ""
    t.string  "type",        limit: 255,                null: false
    t.string  "description", limit: 255,   default: ""
    t.text    "core_params", limit: 65535
    t.text    "app_params",  limit: 65535
    t.integer "ordering",    limit: 4,     default: 0,  null: false
    t.integer "published",   limit: 1,     default: 0,  null: false
  end

  create_table "wlje4_payplans_config", primary_key: "config_id", force: :cascade do |t|
    t.string "key",   limit: 255,   null: false
    t.text   "value", limit: 65535
  end

  add_index "wlje4_payplans_config", ["key"], name: "idx_key", unique: true, using: :btree

  create_table "wlje4_payplans_country", primary_key: "country_id", force: :cascade do |t|
    t.string  "title",     limit: 255, null: false
    t.string  "isocode2",  limit: 2
    t.string  "isocode3",  limit: 3
    t.integer "isocode3n", limit: 4
  end

  create_table "wlje4_payplans_currency", primary_key: "currency_id", force: :cascade do |t|
    t.string  "title",     limit: 255
    t.boolean "published",               default: true
    t.text    "params",    limit: 65535
    t.string  "symbol",    limit: 5
  end

  create_table "wlje4_payplans_field_map", primary_key: "plan_id", force: :cascade do |t|
    t.string  "plan_title", limit: 80
    t.string  "program",    limit: 57
    t.string  "gradelevel", limit: 50
    t.integer "year",       limit: 4
    t.string  "subtype",    limit: 50
  end

  create_table "wlje4_payplans_group", primary_key: "group_id", force: :cascade do |t|
    t.string  "title",       limit: 255,                  null: false
    t.integer "parent",      limit: 4,     default: 0,    null: false
    t.boolean "published",                 default: true
    t.boolean "visible",                   default: true
    t.integer "ordering",    limit: 4,     default: 0
    t.text    "description", limit: 65535
    t.text    "params",      limit: 65535
  end

  create_table "wlje4_payplans_invoice", primary_key: "invoice_id", force: :cascade do |t|
    t.integer  "object_id",        limit: 4,                              default: 10010, null: false
    t.string   "object_type",      limit: 255
    t.integer  "user_id",          limit: 4,                                              null: false
    t.decimal  "subtotal",                       precision: 15, scale: 5, default: 0.0
    t.decimal  "total",                          precision: 15, scale: 5, default: 0.0,   null: false
    t.string   "currency",         limit: 3
    t.integer  "counter",          limit: 4,                              default: 0
    t.integer  "status",           limit: 4,                              default: 0,     null: false
    t.text     "params",           limit: 65535
    t.datetime "created_date",                                                            null: false
    t.datetime "modified_date",                                                           null: false
    t.integer  "checked_out",      limit: 4,                              default: 0
    t.datetime "checked_out_time"
    t.datetime "paid_date"
  end

  add_index "wlje4_payplans_invoice", ["object_id"], name: "idx_order_id", using: :btree
  add_index "wlje4_payplans_invoice", ["user_id"], name: "idx_user_id", using: :btree

  create_table "wlje4_payplans_invoice_bkup", primary_key: "invoice_id", force: :cascade do |t|
    t.integer  "object_id",        limit: 4,                              default: 10010, null: false
    t.string   "object_type",      limit: 255
    t.integer  "user_id",          limit: 4,                                              null: false
    t.decimal  "subtotal",                       precision: 15, scale: 5, default: 0.0
    t.decimal  "total",                          precision: 15, scale: 5, default: 0.0,   null: false
    t.string   "currency",         limit: 3
    t.integer  "counter",          limit: 4,                              default: 0
    t.integer  "status",           limit: 4,                              default: 0,     null: false
    t.text     "params",           limit: 65535
    t.datetime "created_date",                                                            null: false
    t.datetime "modified_date",                                                           null: false
    t.integer  "checked_out",      limit: 4,                              default: 0
    t.datetime "checked_out_time"
  end

  add_index "wlje4_payplans_invoice_bkup", ["object_id"], name: "idx_order_id", using: :btree
  add_index "wlje4_payplans_invoice_bkup", ["user_id"], name: "idx_user_id", using: :btree

  create_table "wlje4_payplans_log", primary_key: "log_id", force: :cascade do |t|
    t.integer  "level",          limit: 4,     default: 0,     null: false
    t.integer  "owner_id",       limit: 4,                     null: false
    t.integer  "user_id",        limit: 4,                     null: false
    t.string   "class",          limit: 255,                   null: false
    t.integer  "object_id",      limit: 4,                     null: false
    t.text     "message",        limit: 65535
    t.string   "user_ip",        limit: 255,                   null: false
    t.datetime "created_date",                                 null: false
    t.text     "content",        limit: 65535
    t.boolean  "read",                         default: false
    t.text     "position",       limit: 65535
    t.text     "previous_token", limit: 65535
    t.text     "current_token",  limit: 65535
  end

  add_index "wlje4_payplans_log", ["level"], name: "idx_level", using: :btree

  create_table "wlje4_payplans_modifier", primary_key: "modifier_id", force: :cascade do |t|
    t.integer "user_id",    limit: 4,                                             null: false
    t.integer "invoice_id", limit: 4
    t.decimal "amount",                   precision: 15, scale: 5, default: 0.0
    t.string  "type",       limit: 255
    t.string  "reference",  limit: 255
    t.text    "message",    limit: 65535
    t.boolean "percentage",                                        default: true, null: false
    t.integer "serial",     limit: 4,                              default: 0,    null: false
    t.string  "frequency",  limit: 255
  end

  add_index "wlje4_payplans_modifier", ["invoice_id"], name: "idx_user_id", using: :btree

  create_table "wlje4_payplans_order", primary_key: "order_id", force: :cascade do |t|
    t.integer  "buyer_id",         limit: 4,                                            null: false
    t.decimal  "total",                          precision: 15, scale: 5, default: 0.0, null: false
    t.string   "currency",         limit: 3
    t.integer  "status",           limit: 4,                              default: 0,   null: false
    t.integer  "checked_out",      limit: 4,                              default: 0
    t.datetime "checked_out_time"
    t.datetime "created_date",                                                          null: false
    t.datetime "modified_date",                                                         null: false
    t.text     "params",           limit: 65535
  end

  add_index "wlje4_payplans_order", ["buyer_id"], name: "idx_buyer_id", using: :btree

  create_table "wlje4_payplans_parentchild", primary_key: "dependent_plan", force: :cascade do |t|
    t.string  "base_plan",              limit: 255
    t.integer "relation",               limit: 4,     default: -2
    t.integer "display_dependent_plan", limit: 4,     default: 0
    t.text    "params",                 limit: 65535
  end

  create_table "wlje4_payplans_payment", primary_key: "payment_id", force: :cascade do |t|
    t.integer  "app_id",           limit: 4,                 null: false
    t.text     "params",           limit: 65535
    t.integer  "invoice_id",       limit: 4,     default: 0, null: false
    t.integer  "user_id",          limit: 4,     default: 0, null: false
    t.text     "gateway_params",   limit: 65535
    t.integer  "checked_out",      limit: 4,     default: 0
    t.datetime "checked_out_time"
    t.datetime "created_date",                               null: false
    t.datetime "modified_date",                              null: false
  end

  add_index "wlje4_payplans_payment", ["invoice_id"], name: "idx_invoice_id", using: :btree

  create_table "wlje4_payplans_plan", primary_key: "plan_id", force: :cascade do |t|
    t.string   "title",            limit: 255,                  null: false
    t.boolean  "published",                      default: true
    t.boolean  "visible",                        default: true
    t.integer  "ordering",         limit: 4,     default: 0
    t.integer  "checked_out",      limit: 4,     default: 0
    t.datetime "checked_out_time"
    t.datetime "modified_date"
    t.text     "description",      limit: 65535
    t.text     "details",          limit: 65535
    t.text     "params",           limit: 65535
  end

  create_table "wlje4_payplans_planapp", primary_key: "planapp_id", force: :cascade do |t|
    t.integer "plan_id", limit: 4, null: false
    t.integer "app_id",  limit: 4, null: false
  end

  create_table "wlje4_payplans_plangroup", primary_key: "plangroup_id", force: :cascade do |t|
    t.integer "group_id", limit: 4, null: false
    t.integer "plan_id",  limit: 4, null: false
  end

  create_table "wlje4_payplans_prodiscount", primary_key: "prodiscount_id", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.string   "coupon_code",   limit: 255
    t.string   "coupon_type",   limit: 255
    t.boolean  "core_discount"
    t.decimal  "coupon_amount",               precision: 15, scale: 5, default: 0.0
    t.string   "plans",         limit: 255
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "published"
    t.text     "params",        limit: 65535
  end

  create_table "wlje4_payplans_purge", id: false, force: :cascade do |t|
    t.integer "Subscription_Id__c", limit: 4
    t.string  "del0",               limit: 50
  end

  create_table "wlje4_payplans_resource", primary_key: "resource_id", force: :cascade do |t|
    t.integer "user_id",          limit: 4,                 null: false
    t.string  "title",            limit: 255,               null: false
    t.string  "value",            limit: 255,               null: false
    t.text    "subscription_ids", limit: 65535
    t.integer "count",            limit: 4,     default: 0, null: false
  end

  add_index "wlje4_payplans_resource", ["user_id", "title"], name: "user_id", using: :btree

  create_table "wlje4_payplans_statistics", primary_key: "statistics_id", force: :cascade do |t|
    t.string   "statistics_type", limit: 255
    t.integer  "purpose_id_1",    limit: 4,               null: false
    t.integer  "purpose_id_2",    limit: 4,   default: 0
    t.integer  "count_1",         limit: 4,   default: 0
    t.integer  "count_2",         limit: 4,   default: 0
    t.integer  "count_3",         limit: 4,   default: 0
    t.integer  "count_4",         limit: 4,   default: 0
    t.integer  "count_5",         limit: 4,   default: 0
    t.integer  "count_6",         limit: 4,   default: 0
    t.integer  "count_7",         limit: 4,   default: 0
    t.integer  "count_8",         limit: 4,   default: 0
    t.integer  "count_9",         limit: 4,   default: 0
    t.integer  "count_10",        limit: 4,   default: 0
    t.string   "details_1",       limit: 255
    t.string   "details_2",       limit: 255
    t.string   "message",         limit: 255
    t.datetime "statistics_date",                         null: false
    t.datetime "modified_date",                           null: false
  end

  add_index "wlje4_payplans_statistics", ["statistics_date"], name: "idx_statistics_date", using: :btree

  create_table "wlje4_payplans_subscription", primary_key: "subscription_id", force: :cascade do |t|
    t.integer  "order_id",          limit: 4,                                                              null: false
    t.integer  "user_id",           limit: 4,                                                              null: false
    t.integer  "plan_id",           limit: 4,                                                              null: false
    t.string   "status",            limit: 11,                             default: "0",                   null: false
    t.decimal  "total",                           precision: 15, scale: 5, default: 0.0
    t.datetime "subscription_date"
    t.datetime "expiration_date",                                          default: '2038-01-01 00:00:00'
    t.datetime "cancel_date"
    t.integer  "checked_out",       limit: 4,                              default: 0
    t.datetime "checked_out_time"
    t.datetime "modified_date"
    t.text     "params",            limit: 65535,                                                          null: false
    t.text     "EmailAddress",      limit: 65535
    t.string   "sf_ext_id",         limit: 255
  end

  create_table "wlje4_payplans_support", primary_key: "support_id", force: :cascade do |t|
    t.string "key",   limit: 45,    null: false
    t.text   "value", limit: 65535
  end

  add_index "wlje4_payplans_support", ["key"], name: "idx_key", unique: true, using: :btree

  create_table "wlje4_payplans_temp_comp_table", primary_key: "old_plan_id", force: :cascade do |t|
    t.integer "new_plan_id", limit: 4
  end

  create_table "wlje4_payplans_transaction", primary_key: "transaction_id", force: :cascade do |t|
    t.integer  "user_id",            limit: 4,                              default: 0
    t.integer  "invoice_id",         limit: 4,                              default: 0
    t.integer  "current_invoice_id", limit: 4,                              default: 0
    t.integer  "payment_id",         limit: 4,                              default: 0
    t.string   "gateway_txn_id",     limit: 255
    t.string   "gateway_parent_txn", limit: 255
    t.string   "gateway_subscr_id",  limit: 255
    t.decimal  "amount",                           precision: 15, scale: 5, default: 0.0
    t.string   "reference",          limit: 255
    t.string   "message",            limit: 255
    t.datetime "created_date",                                                            null: false
    t.text     "params",             limit: 65535
  end

  add_index "wlje4_payplans_transaction", ["user_id"], name: "idx_user_id", using: :btree

  create_table "wlje4_payplans_user", primary_key: "user_id", force: :cascade do |t|
    t.text    "params",     limit: 65535
    t.string  "address",    limit: 255,   default: "", null: false
    t.string  "state",      limit: 255,   default: ""
    t.string  "city",       limit: 255,   default: ""
    t.integer "country",    limit: 4,     default: 0,  null: false
    t.string  "zipcode",    limit: 10,    default: "", null: false
    t.text    "preference", limit: 65535,              null: false
  end

  create_table "wlje4_payplans_wallet", primary_key: "wallet_id", force: :cascade do |t|
    t.integer  "user_id",        limit: 4,                                          null: false
    t.integer  "transaction_id", limit: 4,                            default: 0
    t.decimal  "amount",                     precision: 15, scale: 5, default: 0.0
    t.string   "message",        limit: 255
    t.integer  "invoice_id",     limit: 4,                            default: 0
    t.datetime "created_date",                                                      null: false
  end

  add_index "wlje4_payplans_wallet", ["user_id"], name: "idx_user_id", using: :btree

  create_table "wlje4_postinstall_messages", primary_key: "postinstall_message_id", force: :cascade do |t|
    t.integer "extension_id",       limit: 8,   default: 700,               null: false
    t.string  "title_key",          limit: 255, default: "",                null: false
    t.string  "description_key",    limit: 255, default: "",                null: false
    t.string  "action_key",         limit: 255, default: "",                null: false
    t.string  "language_extension", limit: 255, default: "com_postinstall", null: false
    t.integer "language_client_id", limit: 1,   default: 1,                 null: false
    t.string  "type",               limit: 10,  default: "link",            null: false
    t.string  "action_file",        limit: 255, default: ""
    t.string  "action",             limit: 255, default: ""
    t.string  "condition_file",     limit: 255
    t.string  "condition_method",   limit: 255
    t.string  "version_introduced", limit: 50,  default: "3.2.0",           null: false
    t.integer "enabled",            limit: 1,   default: 1,                 null: false
  end

  create_table "wlje4_ppinstaller_config", primary_key: "config_id", force: :cascade do |t|
    t.string "key",   limit: 255,   null: false
    t.text   "value", limit: 65535
  end

  add_index "wlje4_ppinstaller_config", ["key"], name: "idx_key", unique: true, using: :btree

  create_table "wlje4_pr_admins", force: :cascade do |t|
  end

  create_table "wlje4_pr_author_module", force: :cascade do |t|
    t.integer  "author_id",  limit: 4, null: false
    t.integer  "module_id",  limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "wlje4_pr_author_module", ["author_id", "module_id"], name: "author_module_author_id_module_id_unique", unique: true, using: :btree
  add_index "wlje4_pr_author_module", ["module_id"], name: "author_module_module_id_foreign", using: :btree

  create_table "wlje4_pr_authors", force: :cascade do |t|
  end

  create_table "wlje4_pr_group_roadmap", force: :cascade do |t|
    t.integer  "group_id",   limit: 4, null: false
    t.integer  "roadmap_id", limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "wlje4_pr_group_roadmap", ["group_id", "roadmap_id"], name: "group_roadmap_group_id_roadmap_id_unique", unique: true, using: :btree
  add_index "wlje4_pr_group_roadmap", ["roadmap_id"], name: "group_roadmap_roadmap_id_foreign", using: :btree

  create_table "wlje4_pr_group_user", force: :cascade do |t|
    t.integer  "group_id",   limit: 4, null: false
    t.integer  "user_id",    limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "wlje4_pr_group_user", ["group_id", "user_id"], name: "group_user_group_id_user_id_unique", unique: true, using: :btree
  add_index "wlje4_pr_group_user", ["user_id"], name: "group_user_user_id_foreign", using: :btree

  create_table "wlje4_pr_groups", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "wlje4_pr_lesson_principal", force: :cascade do |t|
    t.integer  "lesson_id",    limit: 4, null: false
    t.integer  "principal_id", limit: 4, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "wlje4_pr_lesson_principal", ["lesson_id"], name: "lesson_principal_lesson_id_foreign", using: :btree
  add_index "wlje4_pr_lesson_principal", ["principal_id"], name: "lesson_principal_principal_id_foreign", using: :btree

  create_table "wlje4_pr_lesson_resource", force: :cascade do |t|
    t.integer  "lesson_id",   limit: 4, null: false
    t.integer  "resource_id", limit: 4, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "wlje4_pr_lesson_resource", ["lesson_id"], name: "lesson_resource_lesson_id_foreign", using: :btree
  add_index "wlje4_pr_lesson_resource", ["resource_id"], name: "lesson_resource_resource_id_foreign", using: :btree

  create_table "wlje4_pr_lessons", force: :cascade do |t|
    t.integer  "author_id",           limit: 4,                       null: false
    t.integer  "module_id",           limit: 4,                       null: false
    t.string   "slug",                limit: 255,                     null: false
    t.integer  "order",               limit: 2,                       null: false
    t.boolean  "bonus",                                               null: false
    t.string   "image_url",           limit: 255
    t.string   "title",               limit: 255,                     null: false
    t.string   "description",         limit: 255
    t.integer  "ect",                 limit: 2,     default: 10,      null: false
    t.string   "type",                limit: 255,   default: "video", null: false
    t.text     "content",             limit: 65535,                   null: false
    t.string   "ask_a_question_link", limit: 255
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "wlje4_pr_lessons", ["author_id"], name: "lessons_author_id_foreign", using: :btree
  add_index "wlje4_pr_lessons", ["module_id"], name: "lessons_module_id_foreign", using: :btree
  add_index "wlje4_pr_lessons", ["slug"], name: "lessons_slug_unique", unique: true, using: :btree

  create_table "wlje4_pr_migrations", id: false, force: :cascade do |t|
    t.string  "migration", limit: 255, null: false
    t.integer "batch",     limit: 4,   null: false
  end

  create_table "wlje4_pr_module_roadmap", force: :cascade do |t|
    t.integer  "module_id",  limit: 4, null: false
    t.integer  "roadmap_id", limit: 4, null: false
    t.integer  "order",      limit: 2, null: false
    t.boolean  "bonus",                null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "wlje4_pr_module_roadmap", ["module_id", "roadmap_id"], name: "module_roadmap_module_id_roadmap_id_unique", unique: true, using: :btree
  add_index "wlje4_pr_module_roadmap", ["roadmap_id"], name: "module_roadmap_roadmap_id_foreign", using: :btree

  create_table "wlje4_pr_modules", force: :cascade do |t|
    t.integer  "author_id",       limit: 4,   null: false
    t.string   "slug",            limit: 255, null: false
    t.string   "joomla_user_id",  limit: 255
    t.string   "discussion_link", limit: 255
    t.string   "image_url",       limit: 255
    t.string   "title",           limit: 255, null: false
    t.string   "description",     limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "wlje4_pr_modules", ["author_id"], name: "modules_author_id_foreign", using: :btree
  add_index "wlje4_pr_modules", ["slug"], name: "modules_slug_unique", unique: true, using: :btree

  create_table "wlje4_pr_password_resets", id: false, force: :cascade do |t|
    t.string   "email",      limit: 255, null: false
    t.string   "token",      limit: 255, null: false
    t.datetime "created_at",             null: false
  end

  add_index "wlje4_pr_password_resets", ["email"], name: "password_resets_email_index", using: :btree
  add_index "wlje4_pr_password_resets", ["token"], name: "password_resets_token_index", using: :btree

  create_table "wlje4_pr_permission_role", force: :cascade do |t|
    t.integer  "permission_id", limit: 4, null: false
    t.integer  "role_id",       limit: 4, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "wlje4_pr_permission_role", ["permission_id", "role_id"], name: "permission_role_permission_id_role_id_unique", unique: true, using: :btree
  add_index "wlje4_pr_permission_role", ["role_id"], name: "permission_role_role_id_foreign", using: :btree

  create_table "wlje4_pr_permissions", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.string   "label",       limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "wlje4_pr_permissions", ["name"], name: "permissions_name_unique", unique: true, using: :btree

  create_table "wlje4_pr_principals", force: :cascade do |t|
  end

  create_table "wlje4_pr_resources", force: :cascade do |t|
    t.string   "title",       limit: 255, null: false
    t.string   "slug",        limit: 255, null: false
    t.string   "url",         limit: 255, null: false
    t.string   "type",        limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "wlje4_pr_resources", ["slug"], name: "resources_slug_unique", unique: true, using: :btree

  create_table "wlje4_pr_roadmaps", force: :cascade do |t|
    t.integer  "admin_id",              limit: 4,                   null: false
    t.integer  "principal_id",          limit: 4
    t.string   "slug",                  limit: 255,                 null: false
    t.string   "image_url",             limit: 255
    t.string   "title",                 limit: 255,                 null: false
    t.string   "description",           limit: 255
    t.boolean  "force_modules_enabled",             default: false, null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "wlje4_pr_roadmaps", ["admin_id"], name: "roadmaps_admin_id_foreign", using: :btree
  add_index "wlje4_pr_roadmaps", ["principal_id"], name: "roadmaps_principal_id_foreign", using: :btree
  add_index "wlje4_pr_roadmaps", ["slug"], name: "roadmaps_slug_unique", unique: true, using: :btree

  create_table "wlje4_pr_role_user", force: :cascade do |t|
    t.integer  "role_id",    limit: 4, null: false
    t.integer  "user_id",    limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "wlje4_pr_role_user", ["role_id", "user_id"], name: "role_user_role_id_user_id_unique", unique: true, using: :btree
  add_index "wlje4_pr_role_user", ["user_id"], name: "role_user_user_id_foreign", using: :btree

  create_table "wlje4_pr_roles", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.string   "label",       limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "wlje4_pr_roles", ["name"], name: "roles_name_unique", unique: true, using: :btree

  create_table "wlje4_pr_taggables", force: :cascade do |t|
    t.integer "tag_id",        limit: 4,   null: false
    t.integer "taggable_id",   limit: 4,   null: false
    t.string  "taggable_type", limit: 255, null: false
    t.string  "name",          limit: 255, null: false
  end

  create_table "wlje4_pr_tags", force: :cascade do |t|
    t.string   "slug",        limit: 255, null: false
    t.string   "name",        limit: 255, null: false
    t.string   "description", limit: 255, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "wlje4_pr_tags", ["slug"], name: "tags_slug_unique", unique: true, using: :btree

  create_table "wlje4_pr_users", force: :cascade do |t|
    t.string   "uuid",           limit: 36,  null: false
    t.string   "first_name",     limit: 255, null: false
    t.string   "last_name",      limit: 255, null: false
    t.string   "email",          limit: 255, null: false
    t.string   "password",       limit: 60,  null: false
    t.string   "remember_token", limit: 100
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "wlje4_pr_users", ["email"], name: "users_email_unique", unique: true, using: :btree
  add_index "wlje4_pr_users", ["uuid"], name: "users_uuid_unique", unique: true, using: :btree

  create_table "wlje4_rb_ecommerce_country", primary_key: "country_id", force: :cascade do |t|
    t.string  "title",     limit: 255, null: false
    t.string  "isocode2",  limit: 2
    t.string  "isocode3",  limit: 3
    t.integer "isocode3n", limit: 4
  end

  create_table "wlje4_rb_ecommerce_currency", primary_key: "currency_id", force: :cascade do |t|
    t.string  "title",     limit: 255
    t.boolean "published",               default: true
    t.text    "params",    limit: 65535
    t.string  "symbol",    limit: 5
  end

  create_table "wlje4_rb_ecommerce_invoice", primary_key: "invoice_id", force: :cascade do |t|
    t.integer  "object_id",         limit: 4,                              default: 0,   null: false
    t.string   "object_type",       limit: 255
    t.integer  "buyer_id",          limit: 4,                                            null: false
    t.integer  "master_invoice_id", limit: 4,                              default: 0,   null: false
    t.string   "currency",          limit: 3
    t.integer  "sequence",          limit: 4,                              default: 0
    t.string   "serial",            limit: 255,                                          null: false
    t.integer  "status",            limit: 4,                              default: 0,   null: false
    t.string   "title",             limit: 255
    t.string   "expiration_type",   limit: 255,                                          null: false
    t.text     "time_price",        limit: 65535,                                        null: false
    t.integer  "recurrence_count",  limit: 4,                              default: 0,   null: false
    t.decimal  "subtotal",                        precision: 15, scale: 5, default: 0.0
    t.decimal  "total",                           precision: 15, scale: 5, default: 0.0, null: false
    t.text     "notes",             limit: 65535
    t.text     "params",            limit: 65535
    t.datetime "created_date",                                                           null: false
    t.datetime "modified_date",                                                          null: false
    t.datetime "paid_date"
    t.datetime "refund_date"
    t.datetime "due_date"
    t.datetime "issue_date"
    t.string   "processor_type",    limit: 255
    t.text     "processor_config",  limit: 65535
    t.text     "processor_data",    limit: 65535
  end

  add_index "wlje4_rb_ecommerce_invoice", ["buyer_id"], name: "idx_buyer_id", using: :btree
  add_index "wlje4_rb_ecommerce_invoice", ["object_id"], name: "idx_object_id", using: :btree

  create_table "wlje4_rb_ecommerce_modifier", primary_key: "modifier_id", force: :cascade do |t|
    t.integer  "buyer_id",      limit: 4,                                             null: false
    t.integer  "invoice_id",    limit: 4
    t.decimal  "amount",                      precision: 15, scale: 5, default: 0.0
    t.decimal  "value",                       precision: 15, scale: 5
    t.string   "object_type",   limit: 255
    t.string   "object_id",     limit: 255
    t.text     "message",       limit: 65535
    t.boolean  "percentage",                                           default: true, null: false
    t.integer  "serial",        limit: 4,                              default: 0,    null: false
    t.string   "frequency",     limit: 255
    t.datetime "created_date"
    t.datetime "consumed_date"
  end

  add_index "wlje4_rb_ecommerce_modifier", ["buyer_id"], name: "idx_buyer_id", using: :btree
  add_index "wlje4_rb_ecommerce_modifier", ["invoice_id"], name: "idx_invoice_id", using: :btree
  add_index "wlje4_rb_ecommerce_modifier", ["object_id"], name: "idx_object_id", using: :btree
  add_index "wlje4_rb_ecommerce_modifier", ["object_type"], name: "idx_object_type", using: :btree

  create_table "wlje4_rb_ecommerce_transaction", primary_key: "transaction_id", force: :cascade do |t|
    t.integer  "buyer_id",           limit: 4,                              default: 0
    t.integer  "invoice_id",         limit: 4,                              default: 0
    t.string   "processor_type",     limit: 255
    t.string   "gateway_txn_id",     limit: 255
    t.string   "gateway_parent_txn", limit: 255
    t.string   "gateway_subscr_id",  limit: 255
    t.decimal  "amount",                           precision: 15, scale: 5, default: 0.0
    t.string   "payment_status",     limit: 255
    t.string   "message",            limit: 255
    t.datetime "created_date",                                                            null: false
    t.text     "params",             limit: 65535
    t.string   "signature",          limit: 255
  end

  add_index "wlje4_rb_ecommerce_transaction", ["buyer_id"], name: "idx_user_id", using: :btree
  add_index "wlje4_rb_ecommerce_transaction", ["invoice_id"], name: "idx_invoice_id", using: :btree
  add_index "wlje4_rb_ecommerce_transaction", ["signature"], name: "idx_signature", using: :btree

  create_table "wlje4_rbinstaller_config", primary_key: "key", force: :cascade do |t|
    t.text "value", limit: 65535
  end

  create_table "wlje4_redirect_links", force: :cascade do |t|
    t.string   "old_url",       limit: 255,               null: false
    t.string   "new_url",       limit: 255
    t.string   "referer",       limit: 150
    t.string   "comment",       limit: 255
    t.integer  "hits",          limit: 4,   default: 0,   null: false
    t.integer  "published",     limit: 1,                 null: false
    t.datetime "created_date"
    t.datetime "modified_date"
    t.integer  "header",        limit: 2,   default: 301, null: false
  end

  add_index "wlje4_redirect_links", ["modified_date"], name: "idx_link_modifed", using: :btree
  add_index "wlje4_redirect_links", ["old_url"], name: "idx_link_old", unique: true, using: :btree

  create_table "wlje4_redirectonlogin_config", force: :cascade do |t|
    t.text "config", limit: 65535, null: false
  end

  create_table "wlje4_redirectonlogin_dynamics", force: :cascade do |t|
    t.string  "name",     limit: 255,   null: false
    t.text    "value",    limit: 65535, null: false
    t.string  "type",     limit: 100,   null: false
    t.integer "ordering", limit: 4,     null: false
  end

  create_table "wlje4_redirectonlogin_groups", force: :cascade do |t|
    t.integer "group_id",              limit: 4,                            null: false
    t.string  "frontend_type",         limit: 255,                          null: false
    t.string  "frontend_url",          limit: 255,                          null: false
    t.string  "frontend_type_logout",  limit: 255,                          null: false
    t.string  "frontend_url_logout",   limit: 255,                          null: false
    t.string  "backend_type",          limit: 255, default: "normal",       null: false
    t.string  "backend_url",           limit: 255,                          null: false
    t.string  "backend_component",     limit: 255,                          null: false
    t.string  "opening_site",          limit: 20,                           null: false
    t.string  "opening_site_url",      limit: 255,                          null: false
    t.integer "opening_site_home",     limit: 4,                            null: false
    t.integer "menuitem_login",        limit: 4,   default: 0,              null: false
    t.integer "menuitem_open",         limit: 4,   default: 0,              null: false
    t.integer "menuitem_logout",       limit: 4,   default: 0,              null: false
    t.integer "dynamic_login",         limit: 4,   default: 0,              null: false
    t.integer "dynamic_open",          limit: 4,   default: 0,              null: false
    t.integer "dynamic_logout",        limit: 4,   default: 0,              null: false
    t.string  "open_type",             limit: 50,                           null: false
    t.integer "inherit_login",         limit: 4,   default: 0,              null: false
    t.integer "inherit_open",          limit: 4,   default: 0,              null: false
    t.integer "inherit_logout",        limit: 4,   default: 0,              null: false
    t.integer "inherit_backend",       limit: 4,   default: 0,              null: false
    t.string  "logoutbackend_type",    limit: 20,  default: "normal",       null: false
    t.integer "logoutbackend_menu",    limit: 4,   default: 0,              null: false
    t.string  "logoutbackend_url",     limit: 255, default: "../index.php", null: false
    t.integer "logoutbackend_dyna",    limit: 4,   default: 0,              null: false
    t.integer "logoutbackend_inherit", limit: 4,   default: 0,              null: false
    t.string  "first_type",            limit: 20,  default: "normal",       null: false
    t.integer "first_menu",            limit: 4,   default: 0,              null: false
    t.string  "first_url",             limit: 255, default: "index.php",    null: false
    t.integer "first_dyna",            limit: 4,   default: 0,              null: false
    t.integer "first_inherit",         limit: 4,   default: 0,              null: false
    t.integer "loginbackend_dynamic",  limit: 4,   default: 0,              null: false
  end

  create_table "wlje4_redirectonlogin_levels", force: :cascade do |t|
    t.integer "group_id",               limit: 4,                            null: false
    t.string  "frontend_type",          limit: 255,                          null: false
    t.string  "frontend_url",           limit: 255,                          null: false
    t.string  "frontend_type_logout",   limit: 255,                          null: false
    t.string  "frontend_url_logout",    limit: 255,                          null: false
    t.string  "opening_site",           limit: 20,                           null: false
    t.string  "opening_site_url",       limit: 255,                          null: false
    t.integer "opening_site_home",      limit: 4,                            null: false
    t.integer "menuitem_login",         limit: 4,   default: 0,              null: false
    t.integer "menuitem_open",          limit: 4,   default: 0,              null: false
    t.integer "menuitem_logout",        limit: 4,   default: 0,              null: false
    t.integer "dynamic_login",          limit: 4,   default: 0,              null: false
    t.integer "dynamic_open",           limit: 4,   default: 0,              null: false
    t.integer "dynamic_logout",         limit: 4,   default: 0,              null: false
    t.string  "open_type",              limit: 50,                           null: false
    t.integer "inherit_login",          limit: 4,   default: 0,              null: false
    t.integer "inherit_open",           limit: 4,   default: 0,              null: false
    t.integer "inherit_logout",         limit: 4,   default: 0,              null: false
    t.string  "first_type",             limit: 20,  default: "normal",       null: false
    t.integer "first_menu",             limit: 4,   default: 0,              null: false
    t.string  "first_url",              limit: 255, default: "index.php",    null: false
    t.integer "first_dyna",             limit: 4,   default: 0,              null: false
    t.integer "first_inherit",          limit: 4,   default: 0,              null: false
    t.string  "logoutbackend_type",     limit: 20,  default: "normal",       null: false
    t.integer "logoutbackend_menu",     limit: 4,   default: 0,              null: false
    t.string  "logoutbackend_url",      limit: 255, default: "../index.php", null: false
    t.integer "logoutbackend_dyna",     limit: 4,   default: 0,              null: false
    t.integer "logoutbackend_inherit",  limit: 4,   default: 0,              null: false
    t.string  "loginbackend_type",      limit: 50,  default: "normal",       null: false
    t.string  "loginbackend_url",       limit: 255, default: "",             null: false
    t.string  "loginbackend_component", limit: 255, default: "",             null: false
    t.integer "loginbackend_inherit",   limit: 4,   default: 0,              null: false
    t.integer "loginbackend_dynamic",   limit: 4,   default: 0,              null: false
    t.integer "logoutbackend_dynamic",  limit: 4,   default: 0,              null: false
  end

  create_table "wlje4_redirectonlogin_map", force: :cascade do |t|
    t.integer "group_id",    limit: 4,   null: false
    t.integer "level_id",    limit: 4,   null: false
    t.string  "level_title", limit: 255, null: false
  end

  create_table "wlje4_redirectonlogin_order_groups", force: :cascade do |t|
    t.integer "group_id",             limit: 4, null: false
    t.integer "redirect_order_front", limit: 4, null: false
    t.integer "redirect_order_back",  limit: 4, null: false
  end

  create_table "wlje4_redirectonlogin_order_levels", force: :cascade do |t|
    t.integer "level_id",       limit: 4,             null: false
    t.integer "redirect_order", limit: 4,             null: false
    t.integer "order_backend",  limit: 4, default: 0, null: false
  end

  create_table "wlje4_redirectonlogin_sessions", force: :cascade do |t|
    t.string  "session_id",        limit: 200, null: false
    t.string  "url",               limit: 500, null: false
    t.string  "message",           limit: 500, null: false
    t.string  "message_type",      limit: 100, null: false
    t.string  "unixtime",          limit: 14,  null: false
    t.integer "opening_site",      limit: 4,   null: false
    t.string  "ip",                limit: 100, null: false
    t.integer "opening_site_home", limit: 4,   null: false
    t.integer "logout",            limit: 4,   null: false
    t.integer "silent",            limit: 4,   null: false
  end

  create_table "wlje4_redirectonlogin_users", force: :cascade do |t|
    t.integer "user_id",              limit: 4,                            null: false
    t.string  "frontend_type",        limit: 255,                          null: false
    t.string  "frontend_url",         limit: 255,                          null: false
    t.string  "frontend_type_logout", limit: 255,                          null: false
    t.string  "frontend_url_logout",  limit: 255,                          null: false
    t.string  "backend_type",         limit: 255,                          null: false
    t.string  "backend_url",          limit: 255,                          null: false
    t.string  "backend_component",    limit: 255,                          null: false
    t.string  "opening_site",         limit: 20,                           null: false
    t.string  "opening_site_url",     limit: 255,                          null: false
    t.integer "opening_site_home",    limit: 4,                            null: false
    t.integer "menuitem_login",       limit: 4,   default: 0,              null: false
    t.integer "menuitem_open",        limit: 4,   default: 0,              null: false
    t.integer "menuitem_logout",      limit: 4,   default: 0,              null: false
    t.integer "dynamic_login",        limit: 4,   default: 0,              null: false
    t.integer "dynamic_open",         limit: 4,   default: 0,              null: false
    t.integer "dynamic_logout",       limit: 4,   default: 0,              null: false
    t.string  "open_type",            limit: 50,                           null: false
    t.integer "open_front_logout",    limit: 4,                            null: false
    t.integer "open_back_logout",     limit: 4,                            null: false
    t.string  "logoutbackend_type",   limit: 20,  default: "none",         null: false
    t.integer "logoutbackend_menu",   limit: 4,   default: 0,              null: false
    t.string  "logoutbackend_url",    limit: 255, default: "../index.php", null: false
    t.integer "logoutbackend_dyna",   limit: 4,   default: 0,              null: false
    t.string  "first_type",           limit: 20,  default: "none",         null: false
    t.integer "first_menu",           limit: 4,   default: 0,              null: false
    t.string  "first_url",            limit: 255, default: "index.php",    null: false
    t.integer "first_dyna",           limit: 4,   default: 0,              null: false
    t.integer "loginbackend_dynamic", limit: 4,   default: 0,              null: false
  end

  create_table "wlje4_rereplacer", force: :cascade do |t|
    t.text     "name",             limit: 65535,                 null: false
    t.text     "description",      limit: 65535,                 null: false
    t.text     "search",           limit: 65535,                 null: false
    t.text     "replace",          limit: 65535,                 null: false
    t.text     "area",             limit: 65535,                 null: false
    t.text     "params",           limit: 65535,                 null: false
    t.boolean  "published",                      default: false, null: false
    t.integer  "ordering",         limit: 4,     default: 0,     null: false
    t.integer  "checked_out",      limit: 4,     default: 0,     null: false
    t.datetime "checked_out_time",                               null: false
  end

  add_index "wlje4_rereplacer", ["id", "published"], name: "id", using: :btree

  create_table "wlje4_samlogin_authz_hist", force: :cascade do |t|
    t.string   "username",  limit: 500,                     null: false
    t.integer  "group",     limit: 4,                       null: false
    t.string   "email",     limit: 500,                     null: false
    t.datetime "time",                                      null: false
    t.string   "initiator", limit: 1000, default: "manual", null: false
    t.integer  "timeid",    limit: 4,    default: 0,        null: false
  end

  add_index "wlje4_samlogin_authz_hist", ["group"], name: "samlogin_group", using: :btree
  add_index "wlje4_samlogin_authz_hist", ["timeid"], name: "samlogin_timeid", using: :btree
  add_index "wlje4_samlogin_authz_hist", ["username"], name: "samlogin_user", length: {"username"=>255}, using: :btree

  create_table "wlje4_samlogin_session_kvstore", id: false, force: :cascade do |t|
    t.string   "_type",   limit: 30,    null: false
    t.string   "_key",    limit: 50,    null: false
    t.text     "_value",  limit: 65535, null: false
    t.datetime "_expire",               null: false
  end

  add_index "wlje4_samlogin_session_kvstore", ["_expire"], name: "wlje4_samlogin_session_kvstore_expire", using: :btree

  create_table "wlje4_samlogin_session_tableVersion", id: false, force: :cascade do |t|
    t.string  "_name",    limit: 30, null: false
    t.integer "_version", limit: 4,  null: false
  end

  add_index "wlje4_samlogin_session_tableversion", ["_name"], name: "_name", unique: true, using: :btree

  create_table "wlje4_schemas", id: false, force: :cascade do |t|
    t.integer "extension_id", limit: 4,  null: false
    t.string  "version_id",   limit: 20, null: false
  end

  create_table "wlje4_session", primary_key: "session_id", force: :cascade do |t|
    t.integer "client_id", limit: 1,        default: 0,  null: false
    t.integer "guest",     limit: 1,        default: 1
    t.string  "time",      limit: 14,       default: ""
    t.text    "data",      limit: 16777215
    t.integer "userid",    limit: 4,        default: 0
    t.string  "username",  limit: 150,      default: ""
  end

  add_index "wlje4_session", ["time"], name: "time", using: :btree
  add_index "wlje4_session", ["userid"], name: "userid", using: :btree

  create_table "wlje4_sh404sef_aliases", force: :cascade do |t|
    t.string  "newurl", limit: 255, default: "", null: false
    t.string  "alias",  limit: 255, default: "", null: false
    t.integer "type",   limit: 1,   default: 0,  null: false
    t.integer "hits",   limit: 4,   default: 0,  null: false
  end

  add_index "wlje4_sh404sef_aliases", ["alias"], name: "alias", using: :btree
  add_index "wlje4_sh404sef_aliases", ["newurl"], name: "newurl", using: :btree
  add_index "wlje4_sh404sef_aliases", ["type"], name: "type", using: :btree

  create_table "wlje4_sh404sef_metas", force: :cascade do |t|
    t.string  "newurl",                           limit: 255, default: "", null: false
    t.string  "metadesc",                         limit: 255, default: ""
    t.string  "metakey",                          limit: 255, default: ""
    t.string  "metatitle",                        limit: 255, default: ""
    t.string  "metalang",                         limit: 30,  default: ""
    t.string  "metarobots",                       limit: 30,  default: ""
    t.string  "canonical",                        limit: 255, default: ""
    t.integer "og_enable",                        limit: 1,   default: 2,  null: false
    t.string  "og_type",                          limit: 30,  default: ""
    t.string  "og_image",                         limit: 255, default: ""
    t.integer "og_enable_description",            limit: 1,   default: 2,  null: false
    t.integer "og_enable_site_name",              limit: 1,   default: 2,  null: false
    t.string  "og_site_name",                     limit: 255, default: ""
    t.string  "fb_admin_ids",                     limit: 255, default: ""
    t.integer "og_enable_location",               limit: 1,   default: 2,  null: false
    t.string  "og_latitude",                      limit: 30,  default: ""
    t.string  "og_longitude",                     limit: 30,  default: ""
    t.string  "og_street_address",                limit: 255, default: ""
    t.string  "og_locality",                      limit: 255, default: ""
    t.string  "og_postal_code",                   limit: 30,  default: ""
    t.string  "og_region",                        limit: 255, default: ""
    t.string  "og_country_name",                  limit: 255, default: ""
    t.integer "og_enable_contact",                limit: 1,   default: 2,  null: false
    t.string  "og_email",                         limit: 255, default: ""
    t.string  "og_phone_number",                  limit: 255, default: ""
    t.string  "og_fax_number",                    limit: 255, default: ""
    t.integer "og_enable_fb_admin_ids",           limit: 1,   default: 2,  null: false
    t.integer "twittercards_enable",              limit: 1,   default: 2,  null: false
    t.string  "twittercards_site_account",        limit: 100, default: ""
    t.string  "twittercards_creator_account",     limit: 100, default: ""
    t.integer "google_authorship_enable",         limit: 1,   default: 2,  null: false
    t.string  "google_authorship_author_profile", limit: 255, default: ""
    t.string  "google_authorship_author_name",    limit: 255, default: ""
    t.integer "google_publisher_enable",          limit: 1,   default: 2,  null: false
    t.string  "google_publisher_url",             limit: 255, default: ""
  end

  add_index "wlje4_sh404sef_metas", ["newurl"], name: "newurl", using: :btree

  create_table "wlje4_sh404sef_pageids", force: :cascade do |t|
    t.string  "newurl", limit: 255, default: "", null: false
    t.string  "pageid", limit: 255, default: "", null: false
    t.integer "type",   limit: 1,   default: 0,  null: false
    t.integer "hits",   limit: 4,   default: 0,  null: false
  end

  add_index "wlje4_sh404sef_pageids", ["newurl"], name: "newurl", using: :btree
  add_index "wlje4_sh404sef_pageids", ["pageid"], name: "alias", using: :btree
  add_index "wlje4_sh404sef_pageids", ["type"], name: "type", using: :btree

  create_table "wlje4_sh404sef_urls", force: :cascade do |t|
    t.integer "cpt",     limit: 4,   default: 0,  null: false
    t.integer "rank",    limit: 4,   default: 0,  null: false
    t.string  "oldurl",  limit: 255, default: "", null: false
    t.string  "newurl",  limit: 255, default: "", null: false
    t.date    "dateadd",                          null: false
  end

  add_index "wlje4_sh404sef_urls", ["newurl"], name: "newurl", using: :btree
  add_index "wlje4_sh404sef_urls", ["oldurl"], name: "oldurl", using: :btree
  add_index "wlje4_sh404sef_urls", ["rank"], name: "rank", using: :btree

  create_table "wlje4_shlib_consumers", force: :cascade do |t|
    t.string "resource",        limit: 50,  default: "",  null: false
    t.string "context",         limit: 50,  default: "",  null: false
    t.string "min_version",     limit: 20,  default: "0", null: false
    t.string "max_version",     limit: 20,  default: "0", null: false
    t.string "refuse_versions", limit: 255, default: "",  null: false
    t.string "accept_versions", limit: 255, default: "",  null: false
  end

  add_index "wlje4_shlib_consumers", ["context"], name: "idx_context", using: :btree

  create_table "wlje4_shlib_resources", force: :cascade do |t|
    t.string "resource",        limit: 50, default: "",  null: false
    t.string "current_version", limit: 20, default: "0", null: false
  end

  add_index "wlje4_shlib_resources", ["resource"], name: "idx_resource", using: :btree

  create_table "wlje4_sociala_activities_segmentation", primary_key: "activity_id", force: :cascade do |t|
    t.date     "cdate",               null: false
    t.datetime "cdate_t",             null: false
    t.integer  "cdate_u",  limit: 4,  null: false
    t.integer  "cweek_n",  limit: 4,  null: false
    t.integer  "cweek_y",  limit: 4,  null: false
    t.string   "cweek_t",  limit: 7,  null: false
    t.string   "cweek",    limit: 7,  null: false
    t.integer  "cmonth_n", limit: 4,  null: false
    t.string   "cmonth_t", limit: 7,  null: false
    t.string   "cmonth",   limit: 16, null: false
    t.integer  "cyear",    limit: 4,  null: false
    t.string   "source",   limit: 1,  null: false
  end

  create_table "wlje4_sociala_albums_segmentation", primary_key: "album_id", force: :cascade do |t|
    t.date     "cdate",               null: false
    t.datetime "cdate_t",             null: false
    t.integer  "cdate_u",  limit: 4,  null: false
    t.integer  "cweek_n",  limit: 4,  null: false
    t.integer  "cweek_y",  limit: 4,  null: false
    t.string   "cweek_t",  limit: 7,  null: false
    t.string   "cweek",    limit: 7,  null: false
    t.integer  "cmonth_n", limit: 4,  null: false
    t.string   "cmonth_t", limit: 7,  null: false
    t.string   "cmonth",   limit: 16, null: false
    t.integer  "cyear",    limit: 4,  null: false
    t.string   "source",   limit: 1,  null: false
  end

  create_table "wlje4_sociala_config", id: false, force: :cascade do |t|
    t.string "name",   limit: 64,    null: false
    t.text   "params", limit: 65535, null: false
  end

  create_table "wlje4_sociala_connection_segmentation", primary_key: "connection_id", force: :cascade do |t|
    t.date     "cdate",               null: false
    t.datetime "cdate_t",             null: false
    t.integer  "cdate_u",  limit: 4,  null: false
    t.integer  "cweek_n",  limit: 4,  null: false
    t.integer  "cweek_y",  limit: 4,  null: false
    t.string   "cweek_t",  limit: 7,  null: false
    t.string   "cweek",    limit: 7,  null: false
    t.integer  "cmonth_n", limit: 4,  null: false
    t.string   "cmonth_t", limit: 7,  null: false
    t.string   "cmonth",   limit: 16, null: false
    t.integer  "cyear",    limit: 4,  null: false
    t.string   "source",   limit: 1,  null: false
  end

  create_table "wlje4_sociala_event_cr_segmentation", primary_key: "event_id", force: :cascade do |t|
    t.date     "cdate",               null: false
    t.datetime "cdate_t",             null: false
    t.integer  "cdate_u",  limit: 4,  null: false
    t.integer  "cweek_n",  limit: 4,  null: false
    t.integer  "cweek_y",  limit: 4,  null: false
    t.string   "cweek_t",  limit: 7,  null: false
    t.string   "cweek",    limit: 7,  null: false
    t.integer  "cmonth_n", limit: 4,  null: false
    t.string   "cmonth_t", limit: 7,  null: false
    t.string   "cmonth",   limit: 16, null: false
    t.integer  "cyear",    limit: 4,  null: false
    t.string   "source",   limit: 1,  null: false
  end

  create_table "wlje4_sociala_event_memb_segmentation", primary_key: "event_member_id", force: :cascade do |t|
    t.date     "cdate",               null: false
    t.datetime "cdate_t",             null: false
    t.integer  "cdate_u",  limit: 4,  null: false
    t.integer  "cweek_n",  limit: 4,  null: false
    t.integer  "cweek_y",  limit: 4,  null: false
    t.string   "cweek_t",  limit: 7,  null: false
    t.string   "cweek",    limit: 7,  null: false
    t.integer  "cmonth_n", limit: 4,  null: false
    t.string   "cmonth_t", limit: 7,  null: false
    t.string   "cmonth",   limit: 16, null: false
    t.integer  "cyear",    limit: 4,  null: false
    t.string   "source",   limit: 1,  null: false
  end

  create_table "wlje4_sociala_event_st_segmentation", primary_key: "event_id", force: :cascade do |t|
    t.date     "cdate",               null: false
    t.datetime "cdate_t",             null: false
    t.integer  "cdate_u",  limit: 4,  null: false
    t.integer  "cweek_n",  limit: 4,  null: false
    t.integer  "cweek_y",  limit: 4,  null: false
    t.string   "cweek_t",  limit: 7,  null: false
    t.string   "cweek",    limit: 7,  null: false
    t.integer  "cmonth_n", limit: 4,  null: false
    t.string   "cmonth_t", limit: 7,  null: false
    t.string   "cmonth",   limit: 16, null: false
    t.integer  "cyear",    limit: 4,  null: false
    t.string   "source",   limit: 1,  null: false
  end

  create_table "wlje4_sociala_group_cr_segmentation", primary_key: "group_id", force: :cascade do |t|
    t.date     "cdate",               null: false
    t.datetime "cdate_t",             null: false
    t.integer  "cdate_u",  limit: 4,  null: false
    t.integer  "cweek_n",  limit: 4,  null: false
    t.integer  "cweek_y",  limit: 4,  null: false
    t.string   "cweek_t",  limit: 7,  null: false
    t.string   "cweek",    limit: 7,  null: false
    t.integer  "cmonth_n", limit: 4,  null: false
    t.string   "cmonth_t", limit: 7,  null: false
    t.string   "cmonth",   limit: 16, null: false
    t.integer  "cyear",    limit: 4,  null: false
    t.string   "source",   limit: 1,  null: false
  end

  create_table "wlje4_sociala_history_actions", force: :cascade do |t|
    t.integer "seg_table_id", limit: 4, null: false
    t.string  "action",       limit: 1, null: false
    t.integer "action_time",  limit: 4
  end

  create_table "wlje4_sociala_photos_segmentation", primary_key: "photo_id", force: :cascade do |t|
    t.date     "cdate",               null: false
    t.datetime "cdate_t",             null: false
    t.integer  "cdate_u",  limit: 4,  null: false
    t.integer  "cweek_n",  limit: 4,  null: false
    t.integer  "cweek_y",  limit: 4,  null: false
    t.string   "cweek_t",  limit: 7,  null: false
    t.string   "cweek",    limit: 7,  null: false
    t.integer  "cmonth_n", limit: 4,  null: false
    t.string   "cmonth_t", limit: 7,  null: false
    t.string   "cmonth",   limit: 16, null: false
    t.integer  "cyear",    limit: 4,  null: false
    t.string   "source",   limit: 1,  null: false
  end

  create_table "wlje4_sociala_report_params", force: :cascade do |t|
    t.string "param",        limit: 16,    null: false
    t.text   "param_query",  limit: 65535, null: false
    t.text   "param_values", limit: 65535, null: false
    t.text   "param_clause", limit: 65535, null: false
    t.string "source",       limit: 1,     null: false
  end

  create_table "wlje4_sociala_report_queries", primary_key: "queries_id", force: :cascade do |t|
    t.text    "report_query",        limit: 65535, null: false
    t.integer "report_query_params", limit: 1,     null: false
    t.text    "header_query",        limit: 65535, null: false
    t.integer "header_query_params", limit: 1,     null: false
    t.string  "source",              limit: 1,     null: false
  end

  create_table "wlje4_sociala_report_query_params", force: :cascade do |t|
    t.integer "report_id",   limit: 4,     null: false
    t.integer "query_id",    limit: 4,     null: false
    t.string  "source",      limit: 1,     null: false
    t.string  "query_param", limit: 16,    null: false
    t.text    "query_value", limit: 65535, null: false
  end

  create_table "wlje4_sociala_report_types", primary_key: "type_id", force: :cascade do |t|
    t.string  "name",              limit: 32,             null: false
    t.string  "code",              limit: 1,              null: false
    t.string  "default_report",    limit: 2,              null: false
    t.integer "enabled",           limit: 1,  default: 1, null: false
    t.integer "report_type_order", limit: 4,              null: false
  end

  create_table "wlje4_sociala_reports", force: :cascade do |t|
    t.integer "report_id",                limit: 4,               null: false
    t.integer "report_type",              limit: 4,               null: false
    t.integer "report_layout",            limit: 4,               null: false
    t.string  "name",                     limit: 64,              null: false
    t.string  "code",                     limit: 2,               null: false
    t.integer "queries_id",               limit: 4,               null: false
    t.integer "time_segmented",           limit: 1,   default: 1, null: false
    t.integer "comparison",               limit: 1,   default: 0, null: false
    t.string  "graph_columns",            limit: 64,              null: false
    t.string  "table_columns",            limit: 64,              null: false
    t.string  "non_currency_table_cols",  limit: 64,              null: false
    t.string  "header_columns",           limit: 64,              null: false
    t.string  "non_currency_header_cols", limit: 64,              null: false
    t.string  "header_colors",            limit: 254,             null: false
    t.string  "additional_params",        limit: 254,             null: false
    t.integer "enabled",                  limit: 1,   default: 1, null: false
    t.integer "report_order",             limit: 4,               null: false
  end

  create_table "wlje4_sociala_segmentation_tables", force: :cascade do |t|
    t.string "table_name",        limit: 16, null: false
    t.string "former_table_name", limit: 32, null: false
    t.string "id_field",          limit: 16, null: false
    t.string "former_id_field",   limit: 32, null: false
    t.string "former_date_field", limit: 32, null: false
    t.string "source",            limit: 1,  null: false
  end

  create_table "wlje4_sociala_user_login_segmentation", primary_key: "user_id", force: :cascade do |t|
    t.date     "cdate",               null: false
    t.datetime "cdate_t",             null: false
    t.integer  "cdate_u",  limit: 4,  null: false
    t.integer  "cweek_n",  limit: 4,  null: false
    t.integer  "cweek_y",  limit: 4,  null: false
    t.string   "cweek_t",  limit: 7,  null: false
    t.string   "cweek",    limit: 7,  null: false
    t.integer  "cmonth_n", limit: 4,  null: false
    t.string   "cmonth_t", limit: 7,  null: false
    t.string   "cmonth",   limit: 16, null: false
    t.integer  "cyear",    limit: 4,  null: false
    t.string   "source",   limit: 1,  null: false
  end

  create_table "wlje4_sociala_user_post_segmentation", primary_key: "user_id", force: :cascade do |t|
    t.date     "cdate",               null: false
    t.datetime "cdate_t",             null: false
    t.integer  "cdate_u",  limit: 4,  null: false
    t.integer  "cweek_n",  limit: 4,  null: false
    t.integer  "cweek_y",  limit: 4,  null: false
    t.string   "cweek_t",  limit: 7,  null: false
    t.string   "cweek",    limit: 7,  null: false
    t.integer  "cmonth_n", limit: 4,  null: false
    t.string   "cmonth_t", limit: 7,  null: false
    t.string   "cmonth",   limit: 16, null: false
    t.integer  "cyear",    limit: 4,  null: false
    t.string   "source",   limit: 1,  null: false
  end

  create_table "wlje4_sociala_user_reg_segmentation", primary_key: "user_id", force: :cascade do |t|
    t.date     "cdate",               null: false
    t.datetime "cdate_t",             null: false
    t.integer  "cdate_u",  limit: 4,  null: false
    t.integer  "cweek_n",  limit: 4,  null: false
    t.integer  "cweek_y",  limit: 4,  null: false
    t.string   "cweek_t",  limit: 7,  null: false
    t.string   "cweek",    limit: 7,  null: false
    t.integer  "cmonth_n", limit: 4,  null: false
    t.string   "cmonth_t", limit: 7,  null: false
    t.string   "cmonth",   limit: 16, null: false
    t.integer  "cyear",    limit: 4,  null: false
    t.string   "source",   limit: 1,  null: false
  end

  create_table "wlje4_sociala_videos_segmentation", primary_key: "video_id", force: :cascade do |t|
    t.date     "cdate",               null: false
    t.datetime "cdate_t",             null: false
    t.integer  "cdate_u",  limit: 4,  null: false
    t.integer  "cweek_n",  limit: 4,  null: false
    t.integer  "cweek_y",  limit: 4,  null: false
    t.string   "cweek_t",  limit: 7,  null: false
    t.string   "cweek",    limit: 7,  null: false
    t.integer  "cmonth_n", limit: 4,  null: false
    t.string   "cmonth_t", limit: 7,  null: false
    t.string   "cmonth",   limit: 16, null: false
    t.integer  "cyear",    limit: 4,  null: false
    t.string   "source",   limit: 1,  null: false
  end

  create_table "wlje4_sociala_wall_segmentation", primary_key: "wall_id", force: :cascade do |t|
    t.date     "cdate",               null: false
    t.datetime "cdate_t",             null: false
    t.integer  "cdate_u",  limit: 4,  null: false
    t.integer  "cweek_n",  limit: 4,  null: false
    t.integer  "cweek_y",  limit: 4,  null: false
    t.string   "cweek_t",  limit: 7,  null: false
    t.string   "cweek",    limit: 7,  null: false
    t.integer  "cmonth_n", limit: 4,  null: false
    t.string   "cmonth_t", limit: 7,  null: false
    t.string   "cmonth",   limit: 16, null: false
    t.integer  "cyear",    limit: 4,  null: false
    t.string   "source",   limit: 1,  null: false
  end

  create_table "wlje4_spmedia", force: :cascade do |t|
    t.string   "title",       limit: 255,                        null: false
    t.string   "path",        limit: 255,                        null: false
    t.string   "thumb",       limit: 255,                        null: false
    t.string   "alt",         limit: 255,                        null: false
    t.string   "caption",     limit: 2048,                       null: false
    t.text     "description", limit: 16777215,                   null: false
    t.string   "type",        limit: 100,      default: "image", null: false
    t.string   "extension",   limit: 100,                        null: false
    t.datetime "created_on",                                     null: false
    t.integer  "created_by",  limit: 8,        default: 0,       null: false
    t.datetime "modified_on",                                    null: false
    t.integer  "modified_by", limit: 8,        default: 0,       null: false
  end

  create_table "wlje4_sppagebuilder", force: :cascade do |t|
    t.string   "title",            limit: 255,                   null: false
    t.string   "alias",            limit: 255,      default: "", null: false
    t.text     "text",             limit: 16777215,              null: false
    t.integer  "published",        limit: 1,        default: 1,  null: false
    t.integer  "catid",            limit: 4,        default: 0,  null: false
    t.integer  "access",           limit: 4,        default: 0,  null: false
    t.integer  "ordering",         limit: 4,        default: 0,  null: false
    t.datetime "created_time",                                   null: false
    t.integer  "created_user_id",  limit: 8,        default: 0,  null: false
    t.datetime "modified_time",                                  null: false
    t.integer  "modified_user_id", limit: 8,        default: 0,  null: false
    t.string   "og_title",         limit: 255,                   null: false
    t.string   "og_image",         limit: 255,                   null: false
    t.string   "og_description",   limit: 255,                   null: false
    t.string   "page_layout",      limit: 55
    t.string   "language",         limit: 7,                     null: false
    t.integer  "hits",             limit: 8,        default: 0,  null: false
  end

  create_table "wlje4_sptransfer_log", force: :cascade do |t|
    t.integer  "tables_id",      limit: 4,        default: 0, null: false
    t.text     "note",           limit: 16777215,             null: false
    t.integer  "state",          limit: 1,        default: 0, null: false
    t.integer  "source_id",      limit: 4,        default: 0, null: false
    t.integer  "destination_id", limit: 4,        default: 0, null: false
    t.datetime "created",                                     null: false
  end

  create_table "wlje4_sptransfer_tables", force: :cascade do |t|
    t.string  "extension_name", limit: 100, null: false
    t.string  "name",           limit: 100, null: false
    t.integer "category",       limit: 4
  end

  add_index "wlje4_sptransfer_tables", ["extension_name", "name"], name: "extension_name", unique: true, using: :btree

  create_table "wlje4_tagmeta_rules", force: :cascade do |t|
    t.string   "url",              limit: 255,   default: "",    null: false
    t.boolean  "case_sensitive",                 default: true,  null: false
    t.boolean  "request_only",                   default: true,  null: false
    t.boolean  "decode_url",                     default: true,  null: false
    t.boolean  "last_rule",                      default: true,  null: false
    t.text     "placeholders",     limit: 65535,                 null: false
    t.string   "title",            limit: 255
    t.string   "description",      limit: 255
    t.string   "author",           limit: 255
    t.string   "keywords",         limit: 255
    t.string   "rights",           limit: 255
    t.string   "xreference",       limit: 255
    t.string   "canonical",        limit: 255
    t.boolean  "rindex",                         default: true,  null: false
    t.boolean  "rfollow",                        default: true,  null: false
    t.boolean  "rsnippet",                       default: false, null: false
    t.boolean  "rarchive",                       default: false, null: false
    t.boolean  "rodp",                           default: false, null: false
    t.boolean  "rimageindex",                    default: false, null: false
    t.string   "comment",          limit: 255
    t.boolean  "synonyms",                       default: false, null: false
    t.integer  "synonmax",         limit: 4,     default: 0,     null: false
    t.boolean  "synonweight",                    default: false, null: false
    t.boolean  "preserve_title",                 default: false, null: false
    t.integer  "hits",             limit: 4,     default: 0,     null: false
    t.datetime "last_visit",                                     null: false
    t.integer  "ordering",         limit: 4,     default: 0,     null: false
    t.boolean  "published",                      default: false, null: false
    t.integer  "checked_out",      limit: 4,     default: 0,     null: false
    t.datetime "checked_out_time",                               null: false
  end

  add_index "wlje4_tagmeta_rules", ["url"], name: "idxurl", unique: true, using: :btree

  create_table "wlje4_tagmeta_synonyms", force: :cascade do |t|
    t.string   "keywords",         limit: 500, default: "",    null: false
    t.string   "synonyms",         limit: 500
    t.integer  "weight",           limit: 4,   default: 0,     null: false
    t.string   "comment",          limit: 255
    t.integer  "hits",             limit: 4,   default: 0,     null: false
    t.datetime "last_visit",                                   null: false
    t.integer  "ordering",         limit: 4,   default: 0,     null: false
    t.boolean  "published",                    default: false, null: false
    t.integer  "checked_out",      limit: 4,   default: 0,     null: false
    t.datetime "checked_out_time",                             null: false
  end

  create_table "wlje4_tags", force: :cascade do |t|
    t.integer  "parent_id",        limit: 4,        default: 0
    t.integer  "lft",              limit: 4,        default: 0
    t.integer  "rgt",              limit: 4,        default: 0
    t.integer  "level",            limit: 4,        default: 0
    t.string   "path",             limit: 255,      default: ""
    t.string   "title",            limit: 255
    t.string   "alias",            limit: 255,      default: ""
    t.string   "note",             limit: 255,      default: ""
    t.text     "description",      limit: 16777215
    t.boolean  "published",                         default: false
    t.integer  "checked_out",      limit: 4,        default: 0
    t.datetime "checked_out_time"
    t.integer  "access",           limit: 4,        default: 0
    t.text     "params",           limit: 65535
    t.string   "metadesc",         limit: 1024
    t.string   "metakey",          limit: 1024
    t.string   "metadata",         limit: 2048
    t.integer  "created_user_id",  limit: 4,        default: 0
    t.datetime "created_time"
    t.string   "created_by_alias", limit: 255,      default: ""
    t.integer  "modified_user_id", limit: 4,        default: 0
    t.datetime "modified_time"
    t.text     "images",           limit: 65535
    t.text     "urls",             limit: 65535
    t.integer  "hits",             limit: 4,        default: 0
    t.string   "language",         limit: 7
    t.integer  "version",          limit: 4,        default: 1
    t.datetime "publish_up"
    t.datetime "publish_down"
  end

  add_index "wlje4_tags", ["access"], name: "idx_access", using: :btree
  add_index "wlje4_tags", ["alias"], name: "idx_alias", using: :btree
  add_index "wlje4_tags", ["checked_out"], name: "idx_checkout", using: :btree
  add_index "wlje4_tags", ["language"], name: "idx_language", using: :btree
  add_index "wlje4_tags", ["lft", "rgt"], name: "idx_left_right", using: :btree
  add_index "wlje4_tags", ["path"], name: "idx_path", using: :btree
  add_index "wlje4_tags", ["published", "access"], name: "tag_idx", using: :btree

  create_table "wlje4_template_styles", force: :cascade do |t|
    t.string  "template",  limit: 50,    default: "",    null: false
    t.boolean "client_id",               default: false, null: false
    t.string  "home",      limit: 7,     default: "0",   null: false
    t.string  "title",     limit: 255,   default: "",    null: false
    t.text    "params",    limit: 65535,                 null: false
  end

  add_index "wlje4_template_styles", ["home"], name: "idx_home", using: :btree
  add_index "wlje4_template_styles", ["template"], name: "idx_template", using: :btree

  create_table "wlje4_termsofservice_terms", force: :cascade do |t|
    t.text     "acllist",          limit: 65535, null: false
    t.string   "title",            limit: 255,   null: false
    t.text     "term",             limit: 65535, null: false
    t.datetime "created",                        null: false
    t.integer  "published",        limit: 1,     null: false
    t.integer  "checked_out",      limit: 1,     null: false
    t.datetime "checked_out_time",               null: false
  end

  create_table "wlje4_ucm_base", primary_key: "ucm_id", force: :cascade do |t|
    t.integer "ucm_item_id",     limit: 4, null: false
    t.integer "ucm_type_id",     limit: 4, null: false
    t.integer "ucm_language_id", limit: 4, null: false
  end

  add_index "wlje4_ucm_base", ["ucm_item_id"], name: "idx_ucm_item_id", using: :btree
  add_index "wlje4_ucm_base", ["ucm_language_id"], name: "idx_ucm_language_id", using: :btree
  add_index "wlje4_ucm_base", ["ucm_type_id"], name: "idx_ucm_type_id", using: :btree

  create_table "wlje4_ucm_content", primary_key: "core_content_id", force: :cascade do |t|
    t.string   "core_type_alias",          limit: 255,      default: "",    null: false
    t.string   "core_title",               limit: 255,                      null: false
    t.string   "core_alias",               limit: 255,      default: "",    null: false
    t.text     "core_body",                limit: 16777215,                 null: false
    t.boolean  "core_state",                                default: false, null: false
    t.string   "core_checked_out_time",    limit: 255,      default: "",    null: false
    t.integer  "core_checked_out_user_id", limit: 4,        default: 0,     null: false
    t.integer  "core_access",              limit: 4,        default: 0,     null: false
    t.text     "core_params",              limit: 65535,                    null: false
    t.integer  "core_featured",            limit: 1,        default: 0,     null: false
    t.string   "core_metadata",            limit: 2048,                     null: false
    t.integer  "core_created_user_id",     limit: 4,        default: 0,     null: false
    t.string   "core_created_by_alias",    limit: 255,      default: "",    null: false
    t.datetime "core_created_time",                                         null: false
    t.integer  "core_modified_user_id",    limit: 4,        default: 0,     null: false
    t.datetime "core_modified_time",                                        null: false
    t.string   "core_language",            limit: 7,                        null: false
    t.datetime "core_publish_up",                                           null: false
    t.datetime "core_publish_down",                                         null: false
    t.integer  "core_content_item_id",     limit: 4
    t.integer  "asset_id",                 limit: 4
    t.text     "core_images",              limit: 65535,                    null: false
    t.text     "core_urls",                limit: 65535,                    null: false
    t.integer  "core_hits",                limit: 4,        default: 0,     null: false
    t.integer  "core_version",             limit: 4,        default: 1,     null: false
    t.integer  "core_ordering",            limit: 4,        default: 0,     null: false
    t.text     "core_metakey",             limit: 65535,                    null: false
    t.text     "core_metadesc",            limit: 65535,                    null: false
    t.integer  "core_catid",               limit: 4,        default: 0,     null: false
    t.string   "core_xreference",          limit: 50,                       null: false
    t.integer  "core_type_id",             limit: 4
  end

  add_index "wlje4_ucm_content", ["core_access"], name: "idx_access", using: :btree
  add_index "wlje4_ucm_content", ["core_alias"], name: "idx_alias", using: :btree
  add_index "wlje4_ucm_content", ["core_checked_out_user_id"], name: "idx_core_checked_out_user_id", using: :btree
  add_index "wlje4_ucm_content", ["core_created_time"], name: "idx_created_time", using: :btree
  add_index "wlje4_ucm_content", ["core_created_user_id"], name: "idx_core_created_user_id", using: :btree
  add_index "wlje4_ucm_content", ["core_language"], name: "idx_language", using: :btree
  add_index "wlje4_ucm_content", ["core_modified_time"], name: "idx_modified_time", using: :btree
  add_index "wlje4_ucm_content", ["core_modified_user_id"], name: "idx_core_modified_user_id", using: :btree
  add_index "wlje4_ucm_content", ["core_state", "core_access"], name: "tag_idx", using: :btree
  add_index "wlje4_ucm_content", ["core_title"], name: "idx_title", using: :btree
  add_index "wlje4_ucm_content", ["core_type_alias"], name: "idx_content_type", using: :btree
  add_index "wlje4_ucm_content", ["core_type_id"], name: "idx_core_type_id", using: :btree

  create_table "wlje4_ucm_history", primary_key: "version_id", force: :cascade do |t|
    t.integer  "ucm_item_id",     limit: 4,                     null: false
    t.integer  "ucm_type_id",     limit: 4,                     null: false
    t.string   "version_note",    limit: 255,      default: "", null: false
    t.datetime "save_date",                                     null: false
    t.integer  "editor_user_id",  limit: 4,        default: 0,  null: false
    t.integer  "character_count", limit: 4,        default: 0,  null: false
    t.string   "sha1_hash",       limit: 50,       default: "", null: false
    t.text     "version_data",    limit: 16777215,              null: false
    t.integer  "keep_forever",    limit: 1,        default: 0,  null: false
  end

  add_index "wlje4_ucm_history", ["save_date"], name: "idx_save_date", using: :btree
  add_index "wlje4_ucm_history", ["ucm_type_id", "ucm_item_id"], name: "idx_ucm_item_id", using: :btree

  create_table "wlje4_update_categories", primary_key: "categoryid", force: :cascade do |t|
    t.string  "name",        limit: 20,    default: ""
    t.text    "description", limit: 65535,              null: false
    t.integer "parent",      limit: 4,     default: 0
    t.integer "updatesite",  limit: 4,     default: 0
  end

  create_table "wlje4_update_sites", primary_key: "update_site_id", force: :cascade do |t|
    t.string  "name",                 limit: 100,   default: ""
    t.string  "type",                 limit: 20,    default: ""
    t.text    "location",             limit: 65535,              null: false
    t.integer "enabled",              limit: 4,     default: 0
    t.integer "last_check_timestamp", limit: 8,     default: 0
    t.string  "extra_query",          limit: 1000,  default: ""
  end

  create_table "wlje4_update_sites_extensions", id: false, force: :cascade do |t|
    t.integer "update_site_id", limit: 4, default: 0, null: false
    t.integer "extension_id",   limit: 4, default: 0, null: false
  end

  create_table "wlje4_updates", primary_key: "update_id", force: :cascade do |t|
    t.integer "update_site_id", limit: 4,     default: 0
    t.integer "extension_id",   limit: 4,     default: 0
    t.string  "name",           limit: 100,   default: ""
    t.text    "description",    limit: 65535,              null: false
    t.string  "element",        limit: 100,   default: ""
    t.string  "type",           limit: 20,    default: ""
    t.string  "folder",         limit: 20,    default: ""
    t.integer "client_id",      limit: 1,     default: 0
    t.string  "version",        limit: 32,    default: ""
    t.text    "data",           limit: 65535,              null: false
    t.text    "detailsurl",     limit: 65535,              null: false
    t.text    "infourl",        limit: 65535,              null: false
    t.string  "extra_query",    limit: 1000,  default: ""
  end

  create_table "wlje4_user_keys", force: :cascade do |t|
    t.string  "user_id",  limit: 255, null: false
    t.string  "token",    limit: 255, null: false
    t.string  "series",   limit: 255, null: false
    t.integer "invalid",  limit: 1,   null: false
    t.string  "time",     limit: 200, null: false
    t.string  "uastring", limit: 255, null: false
  end

  add_index "wlje4_user_keys", ["series"], name: "series", unique: true, using: :btree
  add_index "wlje4_user_keys", ["series"], name: "series_2", unique: true, using: :btree
  add_index "wlje4_user_keys", ["series"], name: "series_3", unique: true, using: :btree
  add_index "wlje4_user_keys", ["user_id"], name: "user_id", using: :btree

  create_table "wlje4_user_notes", force: :cascade do |t|
    t.integer  "user_id",          limit: 4,     default: 0,  null: false
    t.integer  "catid",            limit: 4,     default: 0,  null: false
    t.string   "subject",          limit: 100,   default: "", null: false
    t.text     "body",             limit: 65535,              null: false
    t.integer  "state",            limit: 1,     default: 0,  null: false
    t.integer  "checked_out",      limit: 4,     default: 0,  null: false
    t.datetime "checked_out_time",                            null: false
    t.integer  "created_user_id",  limit: 4,     default: 0,  null: false
    t.datetime "created_time",                                null: false
    t.integer  "modified_user_id", limit: 4,                  null: false
    t.datetime "modified_time",                               null: false
    t.datetime "review_time",                                 null: false
    t.datetime "publish_up",                                  null: false
    t.datetime "publish_down",                                null: false
  end

  add_index "wlje4_user_notes", ["catid"], name: "idx_category_id", using: :btree
  add_index "wlje4_user_notes", ["user_id"], name: "idx_user_id", using: :btree

  create_table "wlje4_user_profiles", id: false, force: :cascade do |t|
    t.integer "user_id",       limit: 4,                 null: false
    t.string  "profile_key",   limit: 100,               null: false
    t.text    "profile_value", limit: 65535,             null: false
    t.integer "ordering",      limit: 4,     default: 0, null: false
  end

  add_index "wlje4_user_profiles", ["user_id", "profile_key"], name: "idx_user_id_profile_key", unique: true, using: :btree

  create_table "wlje4_user_usergroup_map", id: false, force: :cascade do |t|
    t.integer "user_id",          limit: 4,  default: 0, null: false
    t.integer "group_id",         limit: 4,  default: 0, null: false
    t.string  "concat_usergroup", limit: 45
  end

  create_table "wlje4_user_usergroupid_match_planid", force: :cascade do |t|
    t.integer "plan_id",       limit: 4
    t.string  "title",         limit: 80
    t.string  "module_key",    limit: 50
    t.string  "usergroupid",   limit: 50
    t.string  "usergroupname", limit: 70
    t.string  "Column1",       limit: 50
  end

  create_table "wlje4_usergroups", force: :cascade do |t|
    t.integer "parent_id", limit: 4,   default: 0,  null: false
    t.integer "lft",       limit: 4,   default: 0,  null: false
    t.integer "rgt",       limit: 4,   default: 0,  null: false
    t.string  "title",     limit: 100, default: "", null: false
  end

  add_index "wlje4_usergroups", ["lft", "rgt"], name: "idx_usergroup_nested_set_lookup", using: :btree
  add_index "wlje4_usergroups", ["parent_id", "title"], name: "idx_usergroup_parent_title_lookup", unique: true, using: :btree
  add_index "wlje4_usergroups", ["parent_id"], name: "idx_usergroup_adjacency_lookup", using: :btree
  add_index "wlje4_usergroups", ["title"], name: "idx_usergroup_title_lookup", using: :btree

  create_table "wlje4_users", force: :cascade do |t|
    t.string   "name",              limit: 255,   default: "",                    null: false
    t.string   "username",          limit: 150,   default: "",                    null: false
    t.string   "email",             limit: 100,   default: "",                    null: false
    t.string   "password",          limit: 100,   default: "",                    null: false
    t.integer  "block",             limit: 1,     default: 0,                     null: false
    t.integer  "sendEmail",         limit: 1,     default: 0
    t.datetime "registerDate",                                                    null: false
    t.datetime "lastvisitDate",                   default: '2001-01-01 01:00:00', null: false
    t.string   "activation",        limit: 100,   default: "",                    null: false
    t.text     "params",            limit: 65535,                                 null: false
    t.datetime "lastResetTime"
    t.integer  "resetCount",        limit: 4,     default: 0,                     null: false
    t.integer  "requireReset",      limit: 1,     default: 0,                     null: false
    t.string   "otpKey",            limit: 1000
    t.string   "otep",              limit: 1000
    t.string   "contactrecordtype", limit: 20
    t.string   "salesforceID",      limit: 20
    t.string   "accountID",         limit: 20,    default: "001d000001HhH4lAAF"
    t.string   "schoolID",          limit: 45
    t.string   "districtID",        limit: 45
    t.string   "lc_user_status",    limit: 45,    default: "Teacher"
    t.string   "cohort",            limit: 45
    t.string   "cohort_start_year", limit: 45
    t.string   "j1_term",           limit: 45
    t.string   "j1_placed_subject", limit: 255
    t.string   "j1_staff_record",   limit: 255
    t.string   "j1_subtype",        limit: 255
    t.string   "secondary_email",   limit: 100
    t.string   "title",             limit: 255
    t.string   "grade",             limit: 255
    t.string   "subject",           limit: 255
    t.string   "process_lab_role",  limit: 45,    default: "Learner"
  end

  add_index "wlje4_users", ["block"], name: "idx_block", using: :btree
  add_index "wlje4_users", ["email"], name: "email", using: :btree
  add_index "wlje4_users", ["email"], name: "unique_email", unique: true, using: :btree
  add_index "wlje4_users", ["name"], name: "idx_name", using: :btree
  add_index "wlje4_users", ["username"], name: "username", using: :btree

  create_table "wlje4_users_lti_test", force: :cascade do |t|
    t.string   "name",              limit: 255,   default: "",                    null: false
    t.string   "username",          limit: 150,   default: "",                    null: false
    t.string   "email",             limit: 100,   default: "",                    null: false
    t.string   "password",          limit: 100,   default: "",                    null: false
    t.integer  "block",             limit: 1,     default: 0,                     null: false
    t.integer  "sendEmail",         limit: 1,     default: 0
    t.datetime "registerDate",                                                    null: false
    t.datetime "lastvisitDate",                   default: '2001-01-01 01:00:00', null: false
    t.string   "activation",        limit: 100,   default: "",                    null: false
    t.text     "params",            limit: 65535,                                 null: false
    t.datetime "lastResetTime"
    t.integer  "resetCount",        limit: 4,     default: 0,                     null: false
    t.integer  "requireReset",      limit: 1,     default: 0,                     null: false
    t.string   "otpKey",            limit: 1000
    t.string   "otep",              limit: 1000
    t.string   "contactrecordtype", limit: 20
    t.string   "salesforceID",      limit: 20
    t.string   "accountID",         limit: 20
    t.string   "match_thisone",     limit: 45
  end

  add_index "wlje4_users_lti_test", ["block"], name: "idx_block", using: :btree
  add_index "wlje4_users_lti_test", ["email"], name: "email", using: :btree
  add_index "wlje4_users_lti_test", ["name"], name: "idx_name", using: :btree
  add_index "wlje4_users_lti_test", ["username"], name: "username", using: :btree

  create_table "wlje4_users_vif_testing", force: :cascade do |t|
    t.string   "name",              limit: 50
    t.string   "username",          limit: 50
    t.string   "email",             limit: 50
    t.string   "password",          limit: 87
    t.integer  "block",             limit: 4
    t.integer  "sendEmail",         limit: 4
    t.datetime "registerDate"
    t.datetime "lastvisitDate"
    t.integer  "activation",        limit: 4
    t.string   "params",            limit: 50
    t.string   "lastResetTime",     limit: 50
    t.integer  "resetCount",        limit: 4
    t.integer  "requireReset",      limit: 4
    t.string   "otpKey",            limit: 50
    t.string   "otep",              limit: 50
    t.string   "contactrecordtype", limit: 50
    t.string   "salesforceID",      limit: 50
    t.string   "accountID",         limit: 50
    t.string   "schoolID",          limit: 50
    t.string   "districtID",        limit: 50
  end

  create_table "wlje4_users_vifonly", force: :cascade do |t|
    t.string   "name",          limit: 57
    t.string   "username",      limit: 65
    t.string   "email",         limit: 66
    t.string   "password",      limit: 95
    t.integer  "block",         limit: 4
    t.integer  "sendEmail",     limit: 4
    t.datetime "registerDate"
    t.datetime "lastvisitDate"
    t.string   "activation",    limit: 50
    t.string   "params",        limit: 165
    t.string   "lastResetTime", limit: 50
    t.integer  "resetCount",    limit: 4
    t.string   "otpKey",        limit: 50
    t.string   "otep",          limit: 50
  end

  create_table "wlje4_viewlevels", force: :cascade do |t|
    t.string  "title",    limit: 100,              null: false
    t.integer "ordering", limit: 4,    default: 0, null: false
    t.string  "rules",    limit: 5120,             null: false
  end

  create_table "wlje4_vif_couponcode_school", force: :cascade do |t|
    t.string "sf_id",       limit: 50,  null: false
    t.string "coupon_code", limit: 100, null: false
    t.string "school_code", limit: 100, null: false
  end

  add_index "wlje4_vif_couponcode_school", ["coupon_code"], name: "coupon_code", using: :btree
  add_index "wlje4_vif_couponcode_school", ["sf_id"], name: "sf_id_idx", using: :btree

  create_table "wlje4_vif_salesforce_exclusion_list", force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.string  "email",   limit: 68
  end

  create_table "wlje4_vif_salesforce_sync_queue", force: :cascade do |t|
    t.integer  "record_id",    limit: 4,             null: false
    t.integer  "sync_ready",   limit: 1, default: 0, null: false
    t.datetime "last_updated"
    t.datetime "last_synced"
    t.datetime "date_created",                       null: false
  end

  add_index "wlje4_vif_salesforce_sync_queue", ["record_id"], name: "record_id", unique: true, using: :btree
  add_index "wlje4_vif_salesforce_sync_queue", ["sync_ready"], name: "sync_ready_idx", using: :btree

  create_table "wlje4_vif_sync_configs", force: :cascade do |t|
    t.string "config_name",       limit: 50,  null: false
    t.string "prod_config_value", limit: 100, null: false
    t.string "dev_config_value",  limit: 100, null: false
  end

  add_index "wlje4_vif_sync_configs", ["config_name"], name: "config_name_idx", using: :btree

  create_table "wlje4_weblinks", force: :cascade do |t|
    t.integer  "catid",            limit: 4,     default: 0,     null: false
    t.string   "title",            limit: 250,   default: "",    null: false
    t.string   "alias",            limit: 255,   default: "",    null: false
    t.string   "url",              limit: 250,   default: "",    null: false
    t.text     "description",      limit: 65535,                 null: false
    t.integer  "hits",             limit: 4,     default: 0,     null: false
    t.boolean  "state",                          default: false, null: false
    t.integer  "checked_out",      limit: 4,     default: 0,     null: false
    t.datetime "checked_out_time",                               null: false
    t.integer  "ordering",         limit: 4,     default: 0,     null: false
    t.integer  "access",           limit: 4,     default: 1,     null: false
    t.text     "params",           limit: 65535,                 null: false
    t.string   "language",         limit: 7,     default: "",    null: false
    t.datetime "created",                                        null: false
    t.integer  "created_by",       limit: 4,     default: 0,     null: false
    t.string   "created_by_alias", limit: 255,   default: "",    null: false
    t.datetime "modified",                                       null: false
    t.integer  "modified_by",      limit: 4,     default: 0,     null: false
    t.text     "metakey",          limit: 65535,                 null: false
    t.text     "metadesc",         limit: 65535,                 null: false
    t.text     "metadata",         limit: 65535,                 null: false
    t.integer  "featured",         limit: 1,     default: 0,     null: false
    t.string   "xreference",       limit: 50,                    null: false
    t.datetime "publish_up",                                     null: false
    t.datetime "publish_down",                                   null: false
    t.integer  "version",          limit: 4,     default: 1,     null: false
    t.text     "images",           limit: 65535,                 null: false
  end

  add_index "wlje4_weblinks", ["access"], name: "idx_access", using: :btree
  add_index "wlje4_weblinks", ["catid"], name: "idx_catid", using: :btree
  add_index "wlje4_weblinks", ["checked_out"], name: "idx_checkout", using: :btree
  add_index "wlje4_weblinks", ["created_by"], name: "idx_createdby", using: :btree
  add_index "wlje4_weblinks", ["featured", "catid"], name: "idx_featured_catid", using: :btree
  add_index "wlje4_weblinks", ["language"], name: "idx_language", using: :btree
  add_index "wlje4_weblinks", ["state"], name: "idx_state", using: :btree
  add_index "wlje4_weblinks", ["xreference"], name: "idx_xreference", using: :btree

  create_table "wlje4_wf_profiles", force: :cascade do |t|
    t.string   "name",             limit: 255,   null: false
    t.text     "description",      limit: 65535, null: false
    t.text     "users",            limit: 65535, null: false
    t.text     "types",            limit: 65535, null: false
    t.text     "components",       limit: 65535, null: false
    t.integer  "area",             limit: 1,     null: false
    t.string   "device",           limit: 255,   null: false
    t.text     "rows",             limit: 65535, null: false
    t.text     "plugins",          limit: 65535, null: false
    t.integer  "published",        limit: 1,     null: false
    t.integer  "ordering",         limit: 4,     null: false
    t.integer  "checked_out",      limit: 1,     null: false
    t.datetime "checked_out_time",               null: false
    t.text     "params",           limit: 65535, null: false
  end

  create_table "wlje4_widgetkit", force: :cascade do |t|
    t.string "name", limit: 255,        null: false
    t.string "type", limit: 255,        null: false
    t.text   "data", limit: 4294967295, null: false
  end

  create_table "wlje4_xipt_aclrules", force: :cascade do |t|
    t.string  "rulename",   limit: 250,   null: false
    t.string  "aclname",    limit: 128,   null: false
    t.text    "coreparams", limit: 65535, null: false
    t.text    "aclparams",  limit: 65535, null: false
    t.boolean "published",                null: false
  end

  create_table "wlje4_xipt_aec", force: :cascade do |t|
    t.integer "planid",      limit: 4, null: false
    t.integer "profiletype", limit: 4, null: false
  end

  create_table "wlje4_xipt_applications", force: :cascade do |t|
    t.integer "applicationid", limit: 4, default: 0, null: false
    t.integer "profiletype",   limit: 4, default: 0, null: false
  end

  create_table "wlje4_xipt_jstoolbar", force: :cascade do |t|
    t.integer "menuid",      limit: 4, default: 0, null: false
    t.integer "profiletype", limit: 4, default: 0, null: false
  end

  create_table "wlje4_xipt_profilefields", force: :cascade do |t|
    t.integer "fid",      limit: 4, default: 0, null: false
    t.integer "pid",      limit: 4, default: 0, null: false
    t.integer "category", limit: 4, default: 0, null: false
  end

  create_table "wlje4_xipt_profiletypes", force: :cascade do |t|
    t.string  "name",            limit: 255,                                                           null: false
    t.integer "ordering",        limit: 4
    t.boolean "published",                     default: true,                                          null: false
    t.text    "tip",             limit: 65535,                                                         null: false
    t.text    "privacy",         limit: 65535,                                                         null: false
    t.string  "template",        limit: 50,    default: "default",                                     null: false
    t.string  "jusertype",       limit: 50,    default: "Registered",                                  null: false
    t.string  "avatar",          limit: 250,   default: "components/com_community/assets/default.jpg", null: false
    t.boolean "approve",                       default: false,                                         null: false
    t.boolean "allowt",                        default: false,                                         null: false
    t.text    "group",           limit: 65535,                                                         null: false
    t.string  "watermark",       limit: 250,                                                           null: false
    t.text    "params",          limit: 65535,                                                         null: false
    t.text    "watermarkparams", limit: 65535,                                                         null: false
    t.boolean "visible",                       default: true,                                          null: false
    t.text    "config",          limit: 65535,                                                         null: false
    t.string  "coverimage",      limit: 255
  end

  create_table "wlje4_xipt_settings", primary_key: "name", force: :cascade do |t|
    t.text "params", limit: 65535, null: false
  end

  create_table "wlje4_xipt_users", primary_key: "userid", force: :cascade do |t|
    t.integer "profiletype", limit: 4,  default: 0,             null: false
    t.string  "template",    limit: 80, default: "NOT_DEFINED", null: false
  end

  add_foreign_key "wlje4_lti_context_v1", "wlje4_lti_consumers", column: "consumer_key", primary_key: "consumer_key", name: "wlje4_wlje4_lti_context_consumer_FK1"
  add_foreign_key "wlje4_lti_nonce_v1", "wlje4_lti_consumers", column: "consumer_key", primary_key: "consumer_key", name: "wlje4_lti_nonce_consumer_FK1"
  add_foreign_key "wlje4_lti_share_key_v1", "wlje4_lti_context_v1", column: "primary_consumer_key", primary_key: "consumer_key", name: "wlje4_lti_share_key_context_FK1"
  add_foreign_key "wlje4_lti_share_key_v1", "wlje4_lti_context_v1", column: "primary_context_id", primary_key: "context_id", name: "wlje4_lti_share_key_context_FK1"
  add_foreign_key "wlje4_pr_admins", "wlje4_pr_users", column: "id", name: "admins_id_foreign", on_update: :cascade, on_delete: :cascade
  add_foreign_key "wlje4_pr_author_module", "wlje4_pr_authors", column: "author_id", name: "author_module_author_id_foreign", on_update: :cascade, on_delete: :cascade
  add_foreign_key "wlje4_pr_author_module", "wlje4_pr_modules", column: "module_id", name: "author_module_module_id_foreign", on_update: :cascade, on_delete: :cascade
  add_foreign_key "wlje4_pr_authors", "wlje4_pr_users", column: "id", name: "authors_id_foreign", on_update: :cascade, on_delete: :cascade
  add_foreign_key "wlje4_pr_group_roadmap", "wlje4_pr_groups", column: "group_id", name: "group_roadmap_group_id_foreign", on_update: :cascade, on_delete: :cascade
  add_foreign_key "wlje4_pr_group_roadmap", "wlje4_pr_roadmaps", column: "roadmap_id", name: "group_roadmap_roadmap_id_foreign", on_update: :cascade, on_delete: :cascade
  add_foreign_key "wlje4_pr_group_user", "wlje4_pr_groups", column: "group_id", name: "group_user_group_id_foreign", on_update: :cascade, on_delete: :cascade
  add_foreign_key "wlje4_pr_group_user", "wlje4_pr_users", column: "user_id", name: "group_user_user_id_foreign", on_update: :cascade, on_delete: :cascade
  add_foreign_key "wlje4_pr_lesson_principal", "wlje4_pr_lessons", column: "lesson_id", name: "lesson_principal_lesson_id_foreign", on_update: :cascade, on_delete: :cascade
  add_foreign_key "wlje4_pr_lesson_principal", "wlje4_pr_principals", column: "principal_id", name: "lesson_principal_principal_id_foreign", on_update: :cascade, on_delete: :cascade
  add_foreign_key "wlje4_pr_lesson_resource", "wlje4_pr_lessons", column: "lesson_id", name: "lesson_resource_lesson_id_foreign", on_update: :cascade, on_delete: :cascade
  add_foreign_key "wlje4_pr_lesson_resource", "wlje4_pr_resources", column: "resource_id", name: "lesson_resource_resource_id_foreign", on_update: :cascade, on_delete: :cascade
  add_foreign_key "wlje4_pr_lessons", "wlje4_pr_authors", column: "author_id", name: "lessons_author_id_foreign", on_update: :cascade, on_delete: :cascade
  add_foreign_key "wlje4_pr_lessons", "wlje4_pr_modules", column: "module_id", name: "lessons_module_id_foreign", on_update: :cascade, on_delete: :cascade
  add_foreign_key "wlje4_pr_module_roadmap", "wlje4_pr_modules", column: "module_id", name: "module_roadmap_module_id_foreign", on_update: :cascade, on_delete: :cascade
  add_foreign_key "wlje4_pr_module_roadmap", "wlje4_pr_roadmaps", column: "roadmap_id", name: "module_roadmap_roadmap_id_foreign", on_update: :cascade, on_delete: :cascade
  add_foreign_key "wlje4_pr_modules", "wlje4_pr_authors", column: "author_id", name: "modules_author_id_foreign", on_update: :cascade, on_delete: :cascade
  add_foreign_key "wlje4_pr_permission_role", "wlje4_pr_permissions", column: "permission_id", name: "permission_role_permission_id_foreign", on_update: :cascade, on_delete: :cascade
  add_foreign_key "wlje4_pr_permission_role", "wlje4_pr_roles", column: "role_id", name: "permission_role_role_id_foreign", on_update: :cascade, on_delete: :cascade
  add_foreign_key "wlje4_pr_principals", "wlje4_pr_users", column: "id", name: "principals_id_foreign", on_update: :cascade, on_delete: :cascade
  add_foreign_key "wlje4_pr_roadmaps", "wlje4_pr_admins", column: "admin_id", name: "roadmaps_admin_id_foreign", on_update: :cascade, on_delete: :cascade
  add_foreign_key "wlje4_pr_roadmaps", "wlje4_pr_principals", column: "principal_id", name: "roadmaps_principal_id_foreign", on_update: :cascade, on_delete: :cascade
  add_foreign_key "wlje4_pr_role_user", "wlje4_pr_roles", column: "role_id", name: "role_user_role_id_foreign", on_update: :cascade, on_delete: :cascade
  add_foreign_key "wlje4_pr_role_user", "wlje4_pr_users", column: "user_id", name: "role_user_user_id_foreign", on_update: :cascade, on_delete: :cascade
end
