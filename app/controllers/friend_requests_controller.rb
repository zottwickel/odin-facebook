class FriendRequestsController < ApplicationController

	before_action :set_friend_request, except: [:index, :create]

	def create
		@friend_request = FriendRequest.create(user_id: params[:user_id], friend_id: current_user.id)
		if @friend_request.save
			flash[:notice] = "Friend request sent"
			redirect_to user_path(params[:user_id])
		else
			flash[:alert] = "Could not send request"
			redirect_to root_path
		end
	end

	def index
		@friend_requests = current_user.friend_requests.all
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
