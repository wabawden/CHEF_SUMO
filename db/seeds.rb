# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"


puts "Deleting existing users and bookings....."
Booking.destroy_all
User.destroy_all

puts "creating 20 users"
# counter1 = 0
# images1 = Unsplash::Photo.search('headshot', 1, 20)
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
#   file1 = URI.open(images[counter])
#   counter1 += 1
#   user.photo.attach(io: file1, filename: 'nes.png', content_type: 'image/png')
  user.save!
  puts "saved #{user.first_name}"
end


puts "assigning chef attributes to chefs"
# counter = 0
# images = Unsplash::Photo.search('food', 1, 25)
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
    
    # file = URI.open(images[counter])
    # counter += 1
    # chef.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    chef.save!
    puts "saved chef attributes for #{chef.user.first_name}"

end


