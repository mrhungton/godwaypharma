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

ActiveRecord::Schema.define(version: 20190906100612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "erp_articles_articles", id: :serial, force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.text "content"
    t.string "meta_keywords"
    t.string "meta_description"
    t.string "tags"
    t.boolean "archived", default: false
    t.integer "category_id"
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "custom_order"
    t.index ["category_id"], name: "index_erp_articles_articles_on_category_id"
    t.index ["creator_id"], name: "index_erp_articles_articles_on_creator_id"
  end

  create_table "erp_articles_categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "parent_id"
    t.string "alias"
    t.boolean "archived", default: false
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "custom_order"
    t.index ["creator_id"], name: "index_erp_articles_categories_on_creator_id"
  end

  create_table "erp_articles_comments", id: :serial, force: :cascade do |t|
    t.text "message"
    t.integer "parent_id"
    t.boolean "archived", default: false
    t.integer "article_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_erp_articles_comments_on_article_id"
    t.index ["user_id"], name: "index_erp_articles_comments_on_user_id"
  end

  create_table "erp_editor_uploads", id: :serial, force: :cascade do |t|
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "erp_user_groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "permissions"
    t.bigint "creator_id"
    t.boolean "active", default: true
    t.index ["creator_id"], name: "index_erp_user_groups_on_creator_id"
  end

  create_table "erp_users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "provider"
    t.string "uid"
    t.boolean "backend_access", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "avatar"
    t.string "timezone"
    t.boolean "active", default: false
    t.integer "creator_id"
    t.text "permissions"
    t.string "confirmation_token"
    t.datetime "confirmed_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "confirmation_sent_at"
    t.bigint "user_group_id"
    t.string "address"
    t.text "data"
    t.text "cache_search"
    t.index ["confirmation_token"], name: "index_erp_users_on_confirmation_token", unique: true
    t.index ["creator_id"], name: "index_erp_users_on_creator_id"
    t.index ["email"], name: "index_erp_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_erp_users_on_reset_password_token", unique: true
    t.index ["user_group_id"], name: "index_erp_users_on_user_group_id"
  end

  create_table "gns_area_countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "cache_search"
  end

  create_table "gns_area_districts", force: :cascade do |t|
    t.string "name"
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "cache_search"
    t.index ["state_id"], name: "index_gns_area_districts_on_state_id"
  end

  create_table "gns_area_states", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "cache_search"
    t.index ["country_id"], name: "index_gns_area_states_on_country_id"
  end

  create_table "gns_contact_categories", force: :cascade do |t|
    t.string "name"
    t.text "cache_search"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "parent_id"
    t.boolean "active", default: true
    t.bigint "creator_id"
    t.index ["creator_id"], name: "index_gns_contact_categories_on_creator_id"
    t.index ["parent_id"], name: "index_gns_contact_categories_on_parent_id"
  end

  create_table "gns_contact_categories_contacts", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "contact_id"
    t.index ["category_id"], name: "index_gns_contact_categories_contacts_on_category_id"
    t.index ["contact_id"], name: "index_gns_contact_categories_contacts_on_contact_id"
  end

  create_table "gns_contact_contacts", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "cache_search"
    t.bigint "country_id"
    t.bigint "state_id"
    t.bigint "district_id"
    t.string "code"
    t.string "mobile"
    t.string "tax_code"
    t.string "invoice_address"
    t.string "website"
    t.string "contact_type"
    t.boolean "active", default: true
    t.string "foreign_name"
    t.string "fax"
    t.text "description"
    t.datetime "birthday"
    t.string "department"
    t.string "position"
    t.bigint "creator_id"
    t.index ["country_id"], name: "index_gns_contact_contacts_on_country_id"
    t.index ["creator_id"], name: "index_gns_contact_contacts_on_creator_id"
    t.index ["district_id"], name: "index_gns_contact_contacts_on_district_id"
    t.index ["state_id"], name: "index_gns_contact_contacts_on_state_id"
  end

  create_table "gns_contact_parent_contacts", force: :cascade do |t|
    t.bigint "parent_id"
    t.bigint "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_gns_contact_parent_contacts_on_contact_id"
    t.index ["parent_id"], name: "index_gns_contact_parent_contacts_on_parent_id"
  end

  create_table "gns_core_roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id"
    t.boolean "active", default: true
    t.index ["creator_id"], name: "index_gns_core_roles_on_creator_id"
  end

  create_table "gns_core_roles_permissions", force: :cascade do |t|
    t.bigint "role_id"
    t.string "permission"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_gns_core_roles_permissions_on_role_id"
  end

  create_table "gns_core_roles_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_gns_core_roles_users_on_role_id"
    t.index ["user_id"], name: "index_gns_core_roles_users_on_user_id"
  end

  create_table "gns_core_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "cache_search"
    t.string "avatar"
    t.bigint "employee_id"
    t.bigint "creator_id"
    t.index ["creator_id"], name: "index_gns_core_users_on_creator_id"
    t.index ["email"], name: "index_gns_core_users_on_email", unique: true
    t.index ["employee_id"], name: "index_gns_core_users_on_employee_id", unique: true
    t.index ["reset_password_token"], name: "index_gns_core_users_on_reset_password_token", unique: true
  end

  create_table "gns_employee_employees", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "department"
    t.string "position"
    t.datetime "starting_date"
    t.string "phone"
    t.string "mobile"
    t.string "email"
    t.string "labor_contract_type"
    t.string "address"
    t.bigint "country_id"
    t.bigint "state_id"
    t.bigint "district_id"
    t.string "cache_search"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id"
    t.string "gender"
    t.datetime "birthday"
    t.datetime "leaving_date"
    t.index ["country_id"], name: "index_gns_employee_employees_on_country_id"
    t.index ["creator_id"], name: "index_gns_employee_employees_on_creator_id"
    t.index ["district_id"], name: "index_gns_employee_employees_on_district_id"
    t.index ["state_id"], name: "index_gns_employee_employees_on_state_id"
  end

  create_table "gns_note_personal_notes", force: :cascade do |t|
    t.string "description"
    t.datetime "due_date"
    t.boolean "is_done", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reminder"
    t.index ["user_id"], name: "index_gns_note_personal_notes_on_user_id"
  end

  create_table "gns_notification_notifications", force: :cascade do |t|
    t.string "phrase"
    t.text "data"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "class_name"
    t.index ["user_id"], name: "index_gns_notification_notifications_on_user_id"
  end

  create_table "gns_notification_notifications_users", force: :cascade do |t|
    t.bigint "notification_id"
    t.bigint "user_id"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notification_id"], name: "index_gns_notification_notifications_users_on_notification_id"
    t.index ["user_id"], name: "index_gns_notification_notifications_users_on_user_id"
  end

  create_table "gns_project_attachments", force: :cascade do |t|
    t.string "file"
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "extension"
    t.float "size"
    t.string "original_name"
    t.datetime "uploaded_at"
    t.index ["task_id"], name: "index_gns_project_attachments_on_task_id"
  end

  create_table "gns_project_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "cache_search"
    t.text "description"
    t.boolean "active", default: true
    t.bigint "creator_id"
    t.index ["creator_id"], name: "index_gns_project_categories_on_creator_id"
  end

  create_table "gns_project_comments", force: :cascade do |t|
    t.text "message"
    t.string "file"
    t.integer "parent_id"
    t.bigint "project_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_gns_project_comments_on_project_id"
    t.index ["user_id"], name: "index_gns_project_comments_on_user_id"
  end

  create_table "gns_project_logs", force: :cascade do |t|
    t.bigint "project_id"
    t.string "class_name"
    t.string "phrase"
    t.text "data"
    t.text "remark"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_gns_project_logs_on_project_id"
    t.index ["user_id"], name: "index_gns_project_logs_on_user_id"
  end

  create_table "gns_project_project_employee_roles", force: :cascade do |t|
    t.bigint "project_employee_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_employee_id"], name: "index_gns_project_project_employee_roles_on_project_employee_id"
    t.index ["role_id"], name: "index_gns_project_project_employee_roles_on_role_id"
  end

  create_table "gns_project_project_employees", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "employee_id"
    t.text "custom_permissions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_gns_project_project_employees_on_employee_id"
    t.index ["project_id"], name: "index_gns_project_project_employees_on_project_id"
  end

  create_table "gns_project_projects", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "cache_search"
    t.bigint "customer_id"
    t.string "priority"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "status"
    t.bigint "manager_id"
    t.bigint "creator_id"
    t.bigint "template_id"
    t.boolean "active", default: true
    t.index ["category_id"], name: "index_gns_project_projects_on_category_id"
    t.index ["creator_id"], name: "index_gns_project_projects_on_creator_id"
    t.index ["customer_id"], name: "index_gns_project_projects_on_customer_id"
    t.index ["manager_id"], name: "index_gns_project_projects_on_manager_id"
    t.index ["template_id"], name: "index_gns_project_projects_on_template_id"
  end

  create_table "gns_project_roles", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id"
    t.index ["creator_id"], name: "index_gns_project_roles_on_creator_id"
  end

  create_table "gns_project_roles_permissions", force: :cascade do |t|
    t.bigint "role_id"
    t.string "permission"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_gns_project_roles_permissions_on_role_id"
  end

  create_table "gns_project_stages", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "custom_order"
    t.text "description"
    t.index ["category_id"], name: "index_gns_project_stages_on_category_id"
  end

  create_table "gns_project_tasks", force: :cascade do |t|
    t.string "name"
    t.bigint "project_id"
    t.bigint "stage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "status"
    t.boolean "finished", default: false
    t.float "hours"
    t.integer "progress", default: 0
    t.integer "custom_order"
    t.bigint "creator_id"
    t.index ["creator_id"], name: "index_gns_project_tasks_on_creator_id"
    t.index ["employee_id"], name: "index_gns_project_tasks_on_employee_id"
    t.index ["project_id"], name: "index_gns_project_tasks_on_project_id"
    t.index ["stage_id"], name: "index_gns_project_tasks_on_stage_id"
  end

  create_table "gns_project_template_details", force: :cascade do |t|
    t.bigint "template_id"
    t.bigint "stage_id"
    t.string "task_description"
    t.integer "custom_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stage_id"], name: "index_gns_project_template_details_on_stage_id"
    t.index ["template_id"], name: "index_gns_project_template_details_on_template_id"
  end

  create_table "gns_project_templates", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id"
    t.text "description"
    t.bigint "creator_id"
    t.text "cache_search"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_gns_project_templates_on_category_id"
    t.index ["creator_id"], name: "index_gns_project_templates_on_creator_id"
  end

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string "foreign_key_name", null: false
    t.integer "foreign_key_id"
    t.index ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key"
    t.index ["version_id"], name: "index_version_associations_on_version_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.integer "transaction_id"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
    t.index ["transaction_id"], name: "index_versions_on_transaction_id"
  end

end
