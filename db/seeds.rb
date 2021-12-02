# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_role = Role.create(name: 'user')

users_manager_role = Role.create(name: 'user_manager')

admin_role = Role.create(name: 'admin')

admin = User.create(username: "admin", password: "admin123", email: "admin@admin.com")
admin.add_role :admin

user1 = User.create(username: "adi", password: "123456", email: "adi.alexiu@gmail.com")
user1.add_role :user
