class Role < ApplicationRecord
  # Runs permissions
  store_attribute :permissions, :create_runs, :boolean, default: false
  store_attribute :permissions, :read_runs, :boolean, default: false
  store_attribute :permissions, :update_runs, :boolean, default: false
  store_attribute :permissions, :delete_runs, :boolean, default: false

  # Users permissions
  store_attribute :permissions, :create_users, :boolean, default: false
  store_attribute :permissions, :read_users, :boolean, default: false
  store_attribute :permissions, :update_users, :boolean, default: false
  store_attribute :permissions, :delete_users, :boolean, default: false
end
