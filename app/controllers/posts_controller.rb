class PostsController < ApplicationController

	def index
		@posts = Post.where("user_id = :user_id #{friend_ids}", user_id: current_user.id)

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

	private

	def friend_ids
		current_user.friends.each do |friend|
			return "OR user_id = #{friend.id} "
		end
	end
end
