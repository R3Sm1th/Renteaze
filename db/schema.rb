# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_12_152046) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bank_references", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employment_documents", force: :cascade do |t|
    t.string "company_name"
    t.datetime "date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identifications", force: :cascade do |t|
    t.string "name"
    t.datetime "issue_date"
    t.datetime "expiration_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "message"
    t.bigint "user_id", null: false
    t.bigint "property_application_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_application_id"], name: "index_messages_on_property_application_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.integer "number"
    t.string "street"
    t.string "town"
    t.string "postcode"
    t.integer "price_per_month"
    t.datetime "availability_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "property_applications", force: :cascade do |t|
    t.string "status"
    t.bigint "property_id", null: false
    t.bigint "user_id", null: false
    t.bigint "identification_id", null: false
    t.bigint "bank_references_id", null: false
    t.bigint "employment_documents_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_references_id"], name: "index_property_applications_on_bank_references_id"
    t.index ["employment_documents_id"], name: "index_property_applications_on_employment_documents_id"
    t.index ["identification_id"], name: "index_property_applications_on_identification_id"
    t.index ["property_id"], name: "index_property_applications_on_property_id"
    t.index ["user_id"], name: "index_property_applications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "surname"
    t.boolean "agent"
    t.boolean "tenant"
    t.integer "contact_number"
    t.string "current_address"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "messages", "property_applications"
  add_foreign_key "messages", "users"
  add_foreign_key "properties", "users"
  add_foreign_key "property_applications", "bank_references", column: "bank_references_id"
  add_foreign_key "property_applications", "employment_documents", column: "employment_documents_id"
  add_foreign_key "property_applications", "identifications"
  add_foreign_key "property_applications", "properties"
  add_foreign_key "property_applications", "users"
end
