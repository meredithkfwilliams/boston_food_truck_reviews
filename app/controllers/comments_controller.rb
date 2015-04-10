class CommentsController < ApplicationController
  def create
    authenticate_user!
    @vendor = Vendor.find(params[:vendor_id])
    @review = Review.find(params[:review_id])
    comment = @review.comments.new(comment_params)
    comment.user_id = current_user.id
    if comment.save
      flash[:notice] = 'Comment added.'
    else
      flash[:notice] = comment.errors.full_messages
    end
    redirect_to vendor_path(@vendor)
  end

  protected

  def comment_params
    params.require(:comment).permit(:comment_body)
  end
end
