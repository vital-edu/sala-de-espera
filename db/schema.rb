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

ActiveRecord::Schema.define(version: 20160925000127) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'roles', force: :cascade do |t|
    t.string   'name'
    t.string   'resource_type'
    t.integer  'resource_id'
    t.datetime 'created_at',    null: false
    t.datetime 'updated_at',    null: false
    t.index %w(name resource_type resource_id), name: 'index_roles_on_name_and_resource_type_and_resource_id', using: :btree
    t.index ['name'], name: 'index_roles_on_name', using: :btree
    t.index %w(resource_type resource_id), name: 'index_roles_on_resource_type_and_resource_id', using: :btree
  end

  create_table 'service_categories', force: :cascade do |t|
    t.string   'name'
    t.decimal  'price'
    t.text     'description'
    t.string   'image_file_name'
    t.string   'image_content_type'
    t.integer  'image_file_size'
    t.datetime 'image_updated_at'
    t.datetime 'created_at',         null: false
    t.datetime 'updated_at',         null: false
  end

  create_table 'services', force: :cascade do |t|
    t.datetime 'scheduled_time'
    t.integer  'status'
    t.datetime 'created_at',          null: false
    t.datetime 'updated_at',          null: false
    t.integer  'employee_id'
    t.integer  'service_category_id'
    t.integer  'client_id'
    t.index ['client_id'], name: 'index_services_on_client_id', using: :btree
    t.index ['employee_id'], name: 'index_services_on_employee_id', using: :btree
    t.index ['service_category_id'], name: 'index_services_on_service_category_id', using: :btree
  end

  create_table 'users', force: :cascade do |t|
    t.string   'name'
    t.string   'cpf'
    t.string   'rg'
    t.integer  'score',                  default: 0
    t.string   'email',                  default: '', null: false
    t.string   'encrypted_password',     default: '', null: false
    t.string   'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer  'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.inet     'current_sign_in_ip'
    t.inet     'last_sign_in_ip'
    t.string   'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string   'unconfirmed_email'
    t.integer  'failed_attempts', default: 0, null: false
    t.string   'unlock_token'
    t.datetime 'locked_at'
    t.string   'password_salt'
    t.datetime 'created_at',                          null: false
    t.datetime 'updated_at',                          null: false
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true, using: :btree
    t.index ['email'], name: 'index_users_on_email', unique: true, using: :btree
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true, using: :btree
    t.index ['unlock_token'], name: 'index_users_on_unlock_token', unique: true, using: :btree
  end

  create_table 'users_roles', id: false, force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'role_id'
    t.index ['role_id'], name: 'index_users_roles_on_role_id', using: :btree
    t.index %w(user_id role_id), name: 'index_users_roles_on_user_id_and_role_id', using: :btree
    t.index ['user_id'], name: 'index_users_roles_on_user_id', using: :btree
  end
end
