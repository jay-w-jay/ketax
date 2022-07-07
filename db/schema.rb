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

ActiveRecord::Schema.define(version: 2022_07_07_134218) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calculation_tax_brackets", force: :cascade do |t|
    t.bigint "calculation_id", null: false
    t.bigint "tax_bracket_id", null: false
    t.decimal "amount", default: "0.0", null: false
    t.decimal "rate", default: "0.0", null: false
    t.decimal "total", default: "0.0", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["calculation_id"], name: "index_calculation_tax_brackets_on_calculation_id"
    t.index ["tax_bracket_id"], name: "index_calculation_tax_brackets_on_tax_bracket_id"
  end

  create_table "calculations", force: :cascade do |t|
    t.decimal "basic_pay", default: "0.0", null: false
    t.decimal "allowances", default: "0.0", null: false
    t.decimal "gross_pay", default: "0.0", null: false
    t.decimal "taxable_pay", default: "0.0", null: false
    t.decimal "tax", default: "0.0", null: false
    t.decimal "tax_relief", default: "0.0", null: false
    t.decimal "paye", default: "0.0", null: false
    t.decimal "nhif", default: "0.0", null: false
    t.decimal "nssf", default: "0.0", null: false
    t.decimal "net_pay", default: "0.0", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tax_brackets", force: :cascade do |t|
    t.decimal "min", default: "0.0", null: false
    t.decimal "max", default: "0.0", null: false
    t.decimal "rate", default: "0.0", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "calculation_tax_brackets", "calculations"
  add_foreign_key "calculation_tax_brackets", "tax_brackets"
end
