# frozen_string_literal: true

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

ActiveRecord::Schema[7.1].define(version: 20_240_217_165_757) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum 'todo_status', %w[completed pending]

  create_table 'todos', force: :cascade do |t|
    t.string 'title'
    t.string 'description'
    t.enum 'status', default: 'pending', enum_type: 'todo_status'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['created_at'], name: 'index_todos_on_created_at'
    t.index ['description'], name: 'index_todos_on_description'
    t.index ['status'], name: 'index_todos_on_status'
    t.index ['title'], name: 'index_todos_on_title'
    t.index ['updated_at'], name: 'index_todos_on_updated_at'
  end
end
