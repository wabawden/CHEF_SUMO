# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"
require "json"


puts "Deleting existing users, bookings,reviews and chefs....."
Review.delete_all
Booking.destroy_all
Chef.destroy_all
User.destroy_all


api_call = Unsplash::Photo.search('headshot', page = 1, per_page = 30)
api_call_page2 = Unsplash::Photo.search('headshot', page = 2, per_page = 30)
api_call_page3 = Unsplash::Photo.search('headshot', page = 3, per_page = 30)
headshots =[]
api_call.each do |photo|
  headshots << photo.urls.regular
end
api_call_page2.each do |photo|
  headshots << photo.urls.regular
end
api_call_page3.each do |photo|
  headshots << photo.urls.regular
end
puts "creating 90 users"
counter1 = 0

90.times do

  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.phone_number,
    address: Faker::Address.street_address,
    postcode: Faker::Address.postcode,
    is_a_chef: [true].sample,
    email: Faker::Internet.free_email,
    password: "123456",

    )
    file1 = URI.open(headshots[counter1])
    counter1 += 1
    user.photo.attach(io: file1, filename: 'nes.png', content_type: 'image/png')
    user.save!
  puts "saved #{user.first_name}"
end

api_call_dinner = Unsplash::Photo.search('dinner', page = 1, per_page = 30)
api_call_dinner_page_2 = Unsplash::Photo.search('dinner', page = 2, per_page = 30)
api_call_dinner_page_3 = Unsplash::Photo.search('dinner', page = 2, per_page = 30)
api_call_dinner_page_4 = Unsplash::Photo.search('dinner', page = 1, per_page = 30)
api_call_dinner_page_5 = Unsplash::Photo.search('dinner', page = 2, per_page = 30)
api_call_dinner_page_6 = Unsplash::Photo.search('dinner', page = 2, per_page = 30)
api_call_dinner_page_7 = Unsplash::Photo.search('dinner', page = 1, per_page = 30)
api_call_dinner_page_8 = Unsplash::Photo.search('dinner', page = 2, per_page = 30)
api_call_dinner_page_9 = Unsplash::Photo.search('dinner', page = 2, per_page = 30)
food =[]
api_call_dinner.each do |photo|
  food << photo.urls.regular
end
api_call_dinner_page_2.each do |photo|
  food << photo.urls.regular
end
api_call_dinner_page_3.each do |photo|
  food << photo.urls.regular
end
api_call_dinner_page_4.each do |photo|
  food << photo.urls.regular
end
api_call_dinner_page_5.each do |photo|
  food << photo.urls.regular
end
api_call_dinner_page_6.each do |photo|
  food << photo.urls.regular
end
api_call_dinner_page_7.each do |photo|
  food << photo.urls.regular
end
api_call_dinner_page_8.each do |photo|
  food << photo.urls.regular
end
api_call_dinner_page_9.each do |photo|
  food << photo.urls.regular
end
cuisines = ["Chinese", "Indian", "Italian", "Mexican", "Japanese", "European", "French"]
london_suburbs = ["Battersea", "Chelsea", "Hammersmith", "Kensington", "Shoreditch", "Westminster", "Clapham"]
ratings = [3, 4, 5]
puts "assigning chef attributes to chefs"
counter = 0
User.where(is_a_chef: true).each do |user|
   chef = Chef.create(
       description: Faker::Hipster.sentences.sample,
       cuisine: cuisines.sample,
       location_range: [5, 10, 20, 30, 50].sample,
       price: [10, 20, 30, 50].sample,
       chef_postcode: london_suburbs.sample
       )
    chef.user = user
    3.times do
      file = URI.open(food[counter])
      chef.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
      counter += 1
    end
    chef.save!
    puts "creating bookings and reviews"
    # every time a chef is created, create 5 bookings for that chef and assign to user
    8.times do
      booking = Booking.new(chef_id: chef.id, user_id: User.where.not(id: chef.user_id).sample.id, price: (100..1000).to_a.sample, date: Time.now - (500..5000000).to_a.sample)
      # edit each of those reviews for booking with content and rating
      review = Review.new(content: Faker::Quotes::Shakespeare.hamlet_quote, rating: ratings.sample)
      review.booking = booking
      review.save!
      booking.save!
    end
    
    puts "saved chef attributes for #{chef.user.first_name}"
end




