class CommentsController < ApplicationController

	def create
		@comment = current_user.comments.create(comment_params)
		if @comment.save
			flash[:notice] = "Comment made"
			redirect_to request.referrer
		else
			flash[:alert] = "Couldn't make comment"
			redirect_to request.referrer
		end
	end

	def destroy
		@comment = Comment.where(commentable_id: params[:object_id], commentable_type: params[:object_type])
		if @comment.destroy
			flash[:notice] = "Comment deleted"
			redirect_to request.referrer
		else
			flash[:alert] = "Couldn't delete comment"
			redirect_to request.referrer
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:commentable_id, :commentable_type, :content)
	end

end
