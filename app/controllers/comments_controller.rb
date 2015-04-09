class CommentsController < ApplicationController

  def create
    authenticate_user!
    @review = Review.find(params[:review_id])
    comment = @review.comments.new(comment_params)
    comment.user_id = current_user.id
    if comment.save
      flash[:notice] = 'Comment added.'
      redirect_to "/vendors/#{params[:vendor_id]}"
    else
      flash[:notice] = comment.errors.full_messages
      redirect_to "/vendors/#{params[:vendor_id]}"
    end
  end

  protected

  def comment_params
    params.require(:comment).permit(:comment_body)
  end
end
