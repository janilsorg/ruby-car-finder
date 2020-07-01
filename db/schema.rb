# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_01_014151) do

  create_table "carros", force: :cascade do |t|
    t.string "nome"
    t.string "ano"
    t.integer "marca_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "modelo_id"
    t.integer "corpo_id"
    t.integer "transmission_id"
    t.index ["corpo_id"], name: "index_carros_on_corpo_id"
    t.index ["marca_id"], name: "index_carros_on_marca_id"
    t.index ["modelo_id"], name: "index_carros_on_modelo_id"
    t.index ["transmission_id"], name: "index_carros_on_transmission_id"
  end

  create_table "corpos", force: :cascade do |t|
    t.string "body_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "marcas", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "modelos", force: :cascade do |t|
    t.string "nome_modelo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transmissions", force: :cascade do |t|
    t.string "transmission_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "carros", "corpos"
  add_foreign_key "carros", "marcas"
  add_foreign_key "carros", "modelos"
  add_foreign_key "carros", "transmissions"
end
