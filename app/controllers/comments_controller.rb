class CommentsController < ApplicationController

	def create
		if params[:comment][:commentable_id].nil?
			@like = Like.new(user_id: params[:user_id], likeable_id: params[:likeable_id], likeable_type: params[:likeable_type])
			if @like.save
				flash[:notice] = "Comment liked"
				redirect_to request.referrer
			else
				flash[:alert] = "Couldn't make comment"
				redirect_to request.referrer
			end
		end
		@comment = current_user.comments.create(comment_params)
		if @comment.save
			flash[:notice] = "Comment made"
			redirect_to request.referrer
		else
			flash[:alert] = "Couldn't make comment"
			redirect_to request.referrer
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:commentable_id, :commentable_type, :content)
	end

end
