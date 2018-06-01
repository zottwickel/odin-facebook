class FriendsController < ApplicationController

	def create
		@friendship = Friendship.new(user_id: current_user.id, friend_id: params[:friend_id])
		if @friendship.save
			flash[:notice] = "Friendship accepted"
			request = FriendRequest.find_by(user_id: current_user.id, friend_id: params[:friend_id])
			request.destroy
			redirect_to user_path(params[:user_id])
		else
			flash[:alert] = "Could not accept request"
			redirect_to root_path
		end
	end

	def index
		@friends = current_user.friendships.all
	end

	def destroy
	end

end
