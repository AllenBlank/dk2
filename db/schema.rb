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

ActiveRecord::Schema.define(version: 20150519163644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: true do |t|
    t.integer  "expansion_id"
    t.string   "card_type"
    t.text     "types"
    t.text     "colors"
    t.string   "name"
    t.string   "rarity"
    t.float    "cmc"
    t.string   "mana_cost"
    t.text     "text"
    t.text     "flavor"
    t.string   "artist"
    t.text     "rulings"
    t.integer  "number"
    t.float    "power"
    t.float    "toughness"
    t.boolean  "reserved"
    t.string   "original_type"
    t.text     "original_text"
    t.float    "loyalty"
    t.boolean  "newest"
    t.text     "color_id"
    t.text     "formats"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cards", ["expansion_id"], name: "index_cards_on_expansion_id", using: :btree
  add_index "cards", ["name"], name: "index_cards_on_name", using: :btree
  add_index "cards", ["newest"], name: "index_cards_on_newest", using: :btree

  create_table "decks", force: true do |t|
    t.integer  "user_id"
    t.string   "format"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expansions", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "block"
    t.datetime "release_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "piles", force: true do |t|
    t.integer  "card_id"
    t.integer  "deck_id"
    t.integer  "count"
    t.string   "board"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "piles", ["card_id"], name: "index_piles_on_card_id", using: :btree
  add_index "piles", ["deck_id"], name: "index_piles_on_deck_id", using: :btree

  create_table "searches", force: true do |t|
    t.integer  "user_id"
    t.text     "name_field"
    t.text     "text_filed"
    t.text     "type_field"
    t.text     "format_field"
    t.text     "color_field"
    t.boolean  "color_exact_field"
    t.string   "sort_by_field"
    t.string   "sort_direction_field"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "searches", ["user_id"], name: "index_searches_on_user_id", using: :btree

  create_table "synergies", force: true do |t|
    t.integer  "pile_id"
    t.integer  "compliment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "synergies", ["compliment_id"], name: "index_synergies_on_compliment_id", using: :btree
  add_index "synergies", ["pile_id", "compliment_id"], name: "index_synergies_on_pile_id_and_compliment_id", unique: true, using: :btree
  add_index "synergies", ["pile_id"], name: "index_synergies_on_pile_id", using: :btree

  create_table "tag_relations", force: true do |t|
    t.integer  "tag_id"
    t.integer  "pile_id"
    t.integer  "deck_id"
    t.integer  "synergy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tag_relations", ["deck_id"], name: "index_tag_relations_on_deck_id", using: :btree
  add_index "tag_relations", ["pile_id"], name: "index_tag_relations_on_pile_id", using: :btree
  add_index "tag_relations", ["synergy_id"], name: "index_tag_relations_on_synergy_id", using: :btree
  add_index "tag_relations", ["tag_id"], name: "index_tag_relations_on_tag_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
