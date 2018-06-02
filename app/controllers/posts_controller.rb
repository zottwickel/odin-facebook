class PostsController < ApplicationController

	def index
		if user_signed_in?
			@posts = current_user.posts
			current_user.friendships.each do |friendship| 
				@posts << friendship.friend.posts
			end
		end
	end

	def create
		@post = current_user.posts.create(title: params[:post][:title], body: params[:post][:body])
		if @post.save
			flash[:notice] = "post posted"
			redirect_to posts_path
		else
			flash[:alert] = "couldn't post post"
			redirect_to posts_path
		end
	end

	def update
	end

	def destroy
	end
end
