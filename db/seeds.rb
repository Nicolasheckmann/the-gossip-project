# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
City.destroy_all
10.times do |i|
  City.create!(name: Faker::Nation.capital_city, zip_code: Faker::Number.decimal_part(digits: 5))
  puts "city number #{i+1}"
end

User.destroy_all
10.times do |i|
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::TvShows::GameOfThrones.quote, email: Faker::Internet.safe_email, age: rand(18..69), city: City.all.sample, password: Faker::Crypto.sha1)
  puts "#{i+1} users created"
end

Gossip.destroy_all
20.times do |i|
  Gossip.create!(title: Faker::Games::Pokemon.name , content: Faker::TvShows::SouthPark.quote , user: User.all.sample)
  puts "#{i+1} gossips created"
end

Tag.destroy_all
10.times do |i|
  Tag.create!(title: Faker::Hipster.word)
  puts "#{i+1} tags created"
end

GossipTaging.destroy_all
Gossip.all.each_with_index do |gossip, i|
  GossipTaging.create!(gossip: gossip, tag: Tag.all.sample)
  puts "#{i+1} gossiptaging created"
end
Tag.all.each_with_index do |tag, i|
  GossipTaging.create!(gossip: Gossip.all.sample, tag: tag)
  puts "#{i+1} gossiptaging created"
end

PrivateMessage.destroy_all
20.times do |i|
  PrivateMessage.create!(content: Faker::TvShows::BigBangTheory.quote, sender: User.all.sample)
  puts "#{i+1} pm created"
end

PrivateMessageRecipient.destroy_all
20.times do |i|
  PrivateMessageRecipient.create!(private_message: PrivateMessage.all.sample, recipient: User.all.sample)
  puts "#{i+1} pmr created"
end