# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.create(name: "admin")
Role.create(name: "host")
Role.create(name: "guest")
User.create(email: "admin@gmail.com", password: "secret123",first_name: "admin",last_name: "adm",user_name: "adminadm",mobile_number: "1234567890", role_id: 1)
