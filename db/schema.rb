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

ActiveRecord::Schema[7.0].define(version: 2023_04_24_053704) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "agencies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "short_name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["name"], name: "index_agencies_on_name", unique: true, order: :desc
  end

  create_table "ca_criminal_incidents", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "crime_date"
    t.string "charge1"
    t.string "charge2"
    t.string "charge3"
    t.string "currently_employed"
    t.string "department"
    t.string "rank"
    t.string "conviction1"
    t.string "conviction2"
    t.string "conviction3"
    t.string "conviction4"
    t.string "news_links"
    t.bigint "incident_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["incident_id"], name: "index_ca_criminal_incidents_on_incident_id"
  end

  create_table "documents", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "incident_id", null: false
    t.index ["incident_id"], name: "index_documents_on_incident_id"
  end

  create_table "friendly_id_slugs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "slug", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.uuid "sluggable_id", null: false
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  end

  create_table "incidents", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "heading", default: "", null: false
    t.string "description", default: "", null: false
    t.datetime "datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lapd_headshots", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "file_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["file_name"], name: "index_lapd_headshots_on_file_name", unique: true
    t.index ["slug"], name: "index_lapd_headshots_on_slug", unique: true
  end

  create_table "officers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "middle_name", default: "", null: false
    t.string "suffix", default: "", null: false
    t.string "post_id"
    t.index ["last_name", "first_name", "middle_name"], name: "index_officers_on_last_name_and_first_name_and_middle_name", order: :desc
    t.index ["post_id"], name: "index_officers_on_post_id", unique: true
    t.index ["slug"], name: "index_officers_on_slug", unique: true
  end

  create_table "positions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "officer_id", null: false
    t.uuid "agency_id", null: false
    t.string "badge_number"
    t.string "serial_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "employment_start"
    t.date "employment_end"
    t.string "rank"
    t.index ["agency_id"], name: "index_positions_on_agency_id"
    t.index ["officer_id"], name: "index_positions_on_officer_id"
  end

  create_table "post_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "officer_id", null: false
    t.string "officer_name", null: false
    t.string "post_id", null: false
    t.string "agency", null: false
    t.string "employment_start_date", null: false
    t.string "employment_end_date"
    t.string "rank", null: false
    t.bigint "position_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agency"], name: "index_post_records_on_agency"
    t.index ["officer_name"], name: "index_post_records_on_officer_name"
    t.index ["position_id"], name: "index_post_records_on_position_id"
    t.index ["post_id"], name: "index_post_records_on_post_id"
    t.index ["rank"], name: "index_post_records_on_rank"
  end

  create_table "roles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "description", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "officer_id", null: false
    t.uuid "incident_id", null: false
    t.index ["incident_id"], name: "index_roles_on_incident_id"
    t.index ["officer_id"], name: "index_roles_on_officer_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "positions", "agencies"
  add_foreign_key "positions", "officers"
  add_foreign_key "roles", "incidents"
  add_foreign_key "roles", "officers"

  create_view "agencies_officers", materialized: true, sql_definition: <<-SQL
      SELECT officers.id AS officer_id,
      positions.agency_id
     FROM (officers
       JOIN positions ON ((officers.id = positions.officer_id)));
  SQL
  add_index "agencies_officers", ["agency_id"], name: "index_agencies_officers_on_agency_id"
  add_index "agencies_officers", ["officer_id"], name: "index_agencies_officers_on_officer_id"

end
