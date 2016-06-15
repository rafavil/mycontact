# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Group.destroy_all
Contact.destroy_all

# generate groups dummy data
groups = []
# create new group and get the id and store to groups array
groups << Group.create(name: "Family").id # 0
groups << Group.create(name: "Friend").id # 1
groups << Group.create(name: "Colleagues").id # 2

contacts = []

# generate 20 fake contacts data

20.times do |i|
  new_contact = {
    id: i,
    name: Faker::Name.name,
    email: Faker::Internet.email,
    company: Faker::Company.name,
    address: "#{Faker::Address.street_name} #{Faker::Address.zip} #{Faker::Address.city}",
    phone: Faker::PhoneNumber.cell_phone,
    group_id: groups[Random.rand(0..2)]
  }
  contacts.push(new_contact)
end

# save the fake data to the database
Contact.create(contacts)

p "#{Group.count} groups successfully created"
p "#{Contact.count} contacts successfully created"