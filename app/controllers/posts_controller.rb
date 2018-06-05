class PostsController < ApplicationController

	def index
		if current_user.friends.any?
			friend_ids = ""
			current_user.friends.each do |friend|
				friend_ids += "OR user_id = #{friend.id} "
			end
		end
		@posts = Post.where("user_id = :user_id #{friend_ids}", user_id: current_user.id)
	end

	def create
		@post = current_user.posts.create(title: params["/post"][:title], body: params["/post"][:body])
		if @post.save
			flash[:notice] = "Post posted"
			redirect_to posts_path
		else
			flash[:alert] = "Couldn't post post"
			redirect_to posts_path
		end
	end
	
	def destroy
		@post = Post.where(id: params[:id])
		if @post.destroy(params[:id])
			flash[:notice] = "Post deleted"
			redirect_to posts_path
		else
			flash[:notice] = "Post couldn't be deleted"
			redirect_to posts_path
		end
	end

end
