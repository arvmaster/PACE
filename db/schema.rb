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

ActiveRecord::Schema.define(version: 2020_07_26_085205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "archivos", force: :cascade do |t|
    t.string "nombre_archivo"
    t.string "topico"
    t.string "asignatura"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "documento"
  end

  create_table "cuestionarios", force: :cascade do |t|
    t.string "nombre_cues"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "datos_carreras", force: :cascade do |t|
    t.string "nombre_carrera"
    t.integer "matricula_hombre"
    t.integer "matricula_mujer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estudios", force: :cascade do |t|
    t.string "nombre_estudio"
    t.string "codigo"
    t.boolean "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "informes", force: :cascade do |t|
    t.string "nombre_inf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pregunta_cuestionarios", force: :cascade do |t|
    t.text "pregunta_cues"
    t.text "respuesta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pregunta_informes", force: :cascade do |t|
    t.text "pregunta_inf"
    t.text "respuesta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recintos", force: :cascade do |t|
    t.string "nombre_recinto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nombre_user"
    t.string "apellido_pa"
    t.string "apellido_ma"
    t.string "rut"
    t.date "fecha_nacimiento"
    t.string "comuna"
    t.string "direccion"
    t.string "nivel_estudio"
    t.integer "fecha_ingreso"
    t.string "especialidad"
    t.string "telefono"
    t.boolean "estado"
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

end
