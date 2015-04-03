class ReviewsController < ApplicationController
  def create
    @vendor = Vendor.find(params[:vendor_id])
    @review = @vendor.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      flash[:notice] = 'Review added.'
      redirect_to "/vendors/#{params[:vendor_id]}"
    else
      flash[:notice] = review.errors.full_messages
      redirect_to "/vendors/#{params[:vendor_id]}"
    end
  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to "/vendors/#{params[:vendor_id]}"
  end

  private

  def review_params
    params.require(:review).permit(:vendor_id, :body, :rating, :user_id)
  end
end
