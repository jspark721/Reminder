require 'faker'

# Create Users
5.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'helloworld'
  )
  user.skip_confirmation!
  user.save!
end

users= User.all

# Create Lists
10.times do
  List.create!(
    user: users.sample,
    title: Faker::Commerce.department,
    description: Faker::Commerce.product_name
  )
end

lists = List.all

# Create Items
30.times do
  Item.create!(
    list: lists.sample,
    content: Faker::Lorem.paragraph
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} to-do lists created"
puts "#{Item.count} to-do items created"
