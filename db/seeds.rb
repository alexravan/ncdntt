# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name: 'Unknown')
Category.create(name: 'Animals and Animal Safety')
Category.create(name: 'Asbestos')
Category.create(name: 'Biological Agents')
Category.create(name: 'Bloodborne Pathogens')
Category.create(name: 'Chemical')
Category.create(name: 'Confined Space')
Category.create(name: 'Cold')
Category.create(name: 'Construction')
Category.create(name: 'Cranes and Hoists')
Category.create(name: 'Driving')
Category.create(name: 'Dust')
Category.create(name: 'Electrical')
Category.create(name: 'Ergonomics')
Category.create(name: 'Fire')
Category.create(name: 'Hazardous Waste')
Category.create(name: 'Heat')
Category.create(name: 'Indoor Air Quality')
Category.create(name: 'Lab Safety')
Category.create(name: 'Lead')
Category.create(name: 'Medical')
Category.create(name: 'Mold')
Category.create(name: 'Oil and Gas')
Category.create(name: 'Radiation')
Category.create(name: 'Scaffolding')
Category.create(name: 'Training')

user1 = User.new
user1.email = 'MINERVA@GAMBLE.com'
user1.first_name = 'MINERVA'
user1.last_name = 'GAMBLE'
user1.password = '12345678'
user1.password_confirmation = '12345678'
user1.save!
user2 = User.new
user2.email = 'JOY@MUNOZ.com'
user2.first_name = 'JOY'
user2.last_name = 'MUNOZ'
user2.password = '12345678'
user2.password_confirmation = '12345678'
user2.save!
user3 = User.new
user3.email = 'NEWTON@GIBSON.com'
user3.first_name = 'NEWTON'
user3.last_name = 'GIBSON'
user3.password = '12345678'
user3.password_confirmation = '12345678'
user3.save!
user4 = User.new
user4.email = 'DENNIS@HARRISON.com'
user4.first_name = 'DENNIS'
user4.last_name = 'HARRISON'
user4.password = '12345678'
user4.password_confirmation = '12345678'
user4.save!
user5 = User.new
user5.email = 'CARY@CARR.com'
user5.first_name = 'CARY'
user5.last_name = 'CARR'
user5.password = '12345678'
user5.password_confirmation = '12345678'
user5.save!
