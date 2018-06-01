class FriendRequestsController < ApplicationController

	before_action :set_friend_request, except: [:index, :create]

	def create
		friend = User.find(params[:friend_id])
		@friend_request = current_user.friend_requests.new(friend: friend)
		if @friend_request.save
			flash[:notice] = "friend request sent"
			redirect_to root_url
		else
			flash[:alert] = "couldn't send friend request"
		end
	end

	def index
		@requests = FriendRequest.where(friend: current_user)
		@sent = current_user.friend_requests
	end

	def destroy
		@friend_request.destroy
		head :no_content
	end

	private

	def set_friend_request
		@friend_request = FriendRequest.find(params[:id])
	end

end
