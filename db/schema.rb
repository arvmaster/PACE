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

ActiveRecord::Schema[7.0].define(version: 2022_04_01_024737) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "archivos", force: :cascade do |t|
    t.string "name"
    t.string "topic"
    t.string "subject"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
  end

  create_table "cuestionarios", force: :cascade do |t|
    t.string "nombre_cues"
    t.integer "eda_a", default: 0
    t.integer "eda_t", default: 0
    t.integer "eda_r", default: 0
    t.integer "eda_p", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
  end

  create_table "datos_carreras", force: :cascade do |t|
    t.string "nombre_carrera"
    t.string "area"
    t.string "institucion"
    t.float "ret_1a"
    t.integer "pun_last_ma"
    t.float "duracion_for"
    t.float "duracion_real"
    t.float "emp_1a"
    t.float "emp_2a"
    t.integer "mat_h"
    t.integer "mat_m"
    t.integer "tit_h"
    t.integer "tit_m"
    t.integer "ing_1a"
    t.integer "ing_5a"
    t.integer "ing_10a"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
    t.integer "cod_institucion"
    t.string "cod_uniq_carrera"
    t.string "titulo"
    t.string "tipo_institucion"
  end

  create_table "estudios", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.boolean "active"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "recinto_id"
  end

  create_table "eventos", force: :cascade do |t|
    t.string "nombre_ev"
    t.date "fecha_ev"
    t.string "link_ev"
    t.string "descripcion"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "informes", force: :cascade do |t|
    t.string "nombre_inf"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
  end

  create_table "pregunta_cuestionarios", force: :cascade do |t|
    t.text "pregunta_cues"
    t.boolean "casilla"
    t.text "respuesta"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "cuestionario_id"
  end

  create_table "pregunta_informes", force: :cascade do |t|
    t.text "pregunta_inf"
    t.text "respuesta"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "informe_id"
  end

  create_table "recintos", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "user_eventos", force: :cascade do |t|
    t.integer "user_id"
    t.integer "evento_id"
    t.boolean "asiste"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "first_last_name"
    t.string "second_last_name"
    t.string "dni"
    t.date "born_date"
    t.string "commune"
    t.string "address"
    t.string "academic_level"
    t.integer "registration_date"
    t.string "specialization_branch"
    t.string "nationality"
    t.string "role", default: "Estudiante", null: false
    t.integer "superviser"
    t.string "phone"
    t.boolean "active"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "recinto_id"
    t.integer "estudio_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "archivos", "users"
  add_foreign_key "cuestionarios", "users"
  add_foreign_key "datos_carreras", "users"
  add_foreign_key "estudios", "recintos"
  add_foreign_key "informes", "users"
  add_foreign_key "pregunta_cuestionarios", "cuestionarios"
  add_foreign_key "pregunta_informes", "informes"
  add_foreign_key "user_eventos", "eventos"
  add_foreign_key "user_eventos", "users"
  add_foreign_key "users", "estudios"
  add_foreign_key "users", "recintos"
end
