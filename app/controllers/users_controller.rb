class UsersController < ApplicationController
  def index
  	@users = User.all.page(params[:page]).per_page(10)
  end

  def show
  	@user = User.find_by(id: params[:id])
  	@posts = @user.posts.page(params[:page]).per_page(10)
  end
end
