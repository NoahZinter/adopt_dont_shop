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

ActiveRecord::Schema.define(version: 20_210_527_022_109) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'pet_petitions', force: :cascade do |t|
    t.bigint 'pet_id'
    t.bigint 'petition_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'status', default: 'Undecided'
    t.index ['pet_id'], name: 'index_pet_petitions_on_pet_id'
    t.index ['petition_id'], name: 'index_pet_petitions_on_petition_id'
  end

  create_table 'petitions', force: :cascade do |t|
    t.string 'name'
    t.string 'street_address'
    t.string 'city'
    t.string 'state'
    t.integer 'zipcode'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'goodhome', default: 'I love dogs'
    t.string 'status', default: 'In Progress'
  end

  create_table 'pets', force: :cascade do |t|
    t.boolean 'adoptable'
    t.integer 'age'
    t.string 'breed'
    t.string 'name'
    t.bigint 'shelter_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['shelter_id'], name: 'index_pets_on_shelter_id'
  end

  create_table 'shelters', force: :cascade do |t|
    t.boolean 'foster_program'
    t.string 'name'
    t.string 'city'
    t.integer 'rank'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'veterinarians', force: :cascade do |t|
    t.boolean 'on_call'
    t.integer 'review_rating'
    t.string 'name'
    t.bigint 'veterinary_office_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['veterinary_office_id'], name: 'index_veterinarians_on_veterinary_office_id'
  end

  create_table 'veterinary_offices', force: :cascade do |t|
    t.boolean 'boarding_services'
    t.integer 'max_patient_capacity'
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'pet_petitions', 'petitions'
  add_foreign_key 'pet_petitions', 'pets'
  add_foreign_key 'pets', 'shelters'
  add_foreign_key 'veterinarians', 'veterinary_offices'
end
