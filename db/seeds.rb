# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mrscott = User.new(name:  "Mr. Scott",
						 			 email: "mrscott@example.com",
						 			 password:              "foobar",
						 			 password_confirmation: "foobar")
mrscott.skip_confirmation!
mrscott.save!
mrscott.confirm


24.times do |n|
	name = Faker::FunnyName.name
	email = "email-#{n+1}@odinbook.com"
	password = "password"
	user = User.new(name:  name,
							    email: email,
							 		password:              password,
							 		password_confirmation: password)
	user.skip_confirmation!
	user.save!
	user.confirm
end

users = User.all

users.each do |user|
	25.times do
		title = Faker::Lorem.sentence(word_count = (rand(1..4)))
		body = Faker::Lorem.paragraph(sentence_count = (rand(1..3)))
		user.posts.create!(title: title, body: body)
	end
end

users.each do |user|
	users.each do |friend|
		user.friends << friend unless (user == friend) ||  user.friends.include?(friend)
	end
end

posts = Post.all

posts.each do |post|
	coin = rand(1..10)
	if coin <= 7
		user_id = rand(1..25)
		content = Faker::Lorem.sentence(word_count = rand(1..4))
		post.comments.create!(user_id: user_id, content: content)
	end
end

comments = Comment.all

comments.each do |comment|
	coin = rand(1..10)
	if coin <= 5
		user_id = rand(1..25)
		content = Faker::Lorem.sentence(word_count = rand(1..4))
		comment.comments.create!(user_id: user_id, content: content)
	end
end

users = User.all
posts = Post.all
comments = Comment.all

users.each do |user|
	posts.each do |post|
		coin = rand(1..10)
		if coin <= 6
			post.likes.create(user_id: user.id)
		end
	end
	comments.each do |comment|
		coin = rand(1..10)
		if coin <= 6
			comment.likes.create(user_id: user.id)
		end
	end
end