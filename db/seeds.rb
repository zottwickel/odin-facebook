# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create!(name:  "Mr. Scott",
# 						 email: "mrscott@example.com",
# 						 password:              "foobar",
# 						 password_confirmation: "foobar")

# 99.times do |n|
# 	name = Faker::FunnyName.name
# 	email = "email-#{n+1}@odinbook.com"
# 	password = "password"
# 	User.create!(name:  name,
# 							 email: email,
# 							 password:              password,
# 							 password_confirmation: password)
# end

# User.all.each { |user| user.confirm }

# users = User.order(:created_at).take(6)

# 50.times do
# 	title = Faker::Lorem.words(rand(1..3))
# 	body = Faker::Lorem.sentence(5)
# 	users.each { |user| user.posts.create!(title: title, body: body) }
# end

# users = User.all
# user = users.first

# users = users[1..50]
# friends = users[1..50]

# users.each { |user_id| friends.each { |friend_id| Friendship.create(user_id: user_id, friend_id: friend_id)}}
# friends.each { |user_id| users.each { |friend_id| Friendship.create(user_id: user_id, friend_id: friend_id)}}
