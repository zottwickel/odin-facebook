class FriendsController < ApplicationController
	before_action :set_friends, except: [:index, :create]

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
		@friendships = current_user.friend_requests.all
	end

	def destroy
		@friendship.destroy
		head :no_content
	end

	private

	def set_friends
		@friendship = Friendship.find(params[:id])
	end
end
