# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(username: "adi", password: "123456", email: "adi.alexiu@gmail.com", birthdate: "26.05.1999", role: Role.find_by(name: 'admin'))

# Admins can manage both users and runs
admin_role = Role.find_or_create_by!(name: "admin") do |r|
  r.create_runs = true
  r.read_runs = true
  r.update_runs = true
  r.delete_runs = true

  r.create_users = true
  r.read_users = true
  r.update_users = true
  r.delete_users = true
end

# User managers can only manage users
user_manager_role = Role.find_or_create_by!(name: "user_manager") do |r|
  r.create_users = true
  r.read_users = true
  r.update_users = true
  r.delete_users = true
end

# Users can only manage their runs
user_role = Role.find_or_create_by!(name: "user") do |r|
  r.create_runs = true
  r.read_runs = true
  r.update_runs = true
  r.delete_runs = true
end