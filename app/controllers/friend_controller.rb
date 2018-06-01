class FriendController < ApplicationController

  def index
  	@friends = current_user.friends
  end

  def create
  end

  def destroy
  	@friend = Friend.find(params[:id])
  	current_user.remove_friend(@friend)
  	head :no_content
  end

end
