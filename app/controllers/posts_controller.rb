class PostsController < ApplicationController

	def index
		if user_signed_in?
			@posts = current_user.posts
			current_user.friendships.each do |friendship| 
				@posts << friendship.friend.posts
			end
		end
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

end
