# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


puts "Deleting existing users and bookings....."
Booking.destroy_all
User.destroy_all

puts "creating 20 users"
20.times do
  user = User.new(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      phone_number: Faker::PhoneNumber.phone_number,
      address: Faker::Address.street_address,
      postcode: Faker::Address.postcode,
      is_a_chef: [true, false].sample,
      email: Faker::Internet.free_email,
      password: "123456",

  )
  user.save!
  puts "saved #{user.first_name}"
end


puts "assigning chef attributes to chefs"
User.where(is_a_chef: true).each do |user|
   chef = Chef.create(
       description: Faker::Hipster.sentences.sample,
       cuisine: Faker::Restaurant.type,
       location_range: [5, 10, 20, 30, 50].sample,
       price: [5, 10, 20, 30, 50].sample,
       rating: [1, 2, 3, 4, 5].sample,
       chef_postcode: Faker::Address.postcode
   )
    chef.user = user
    chef.save!
    puts "saved chef attributes for #{chef.user.first_name}"

end


