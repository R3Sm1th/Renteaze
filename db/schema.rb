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

ActiveRecord::Schema[7.0].define(version: 2023_06_14_134228) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bank_references", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "property_application_id", null: false
    t.index ["property_application_id"], name: "index_bank_references_on_property_application_id"
  end

  create_table "employment_documents", force: :cascade do |t|
    t.string "company_name"
    t.datetime "date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "property_application_id", null: false
    t.index ["property_application_id"], name: "index_employment_documents_on_property_application_id"
  end

  create_table "identifications", force: :cascade do |t|
    t.string "name"
    t.datetime "issue_date"
    t.datetime "expiration_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "property_application_id", null: false
    t.index ["property_application_id"], name: "index_identifications_on_property_application_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "contact_number"
    t.string "current_address"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bank_references", "property_applications"
  add_foreign_key "employment_documents", "property_applications"
  add_foreign_key "identifications", "property_applications"
  add_foreign_key "messages", "property_applications"
  add_foreign_key "messages", "users"
  add_foreign_key "properties", "users"
  add_foreign_key "property_applications", "properties"
  add_foreign_key "property_applications", "users"
end
