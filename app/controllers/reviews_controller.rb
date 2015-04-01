class ReviewsController < ApplicationController
  def new
    binding.pry
  end

  def create
    #is this the proper way to pass in params?
    new_review_data = review_params
    new_review_data[:user_id] = current_user.id
    @vendor = Vendor.find(params[:vendor_id])
    review = @vendor.reviews.new(new_review_data)
    if review.save
      flash[:notice] = ['Review added.']
      redirect_to "/vendors/#{params[:vendor_id]}"
    end
  end

  private
  def review_params
    params.require(:review).permit(:vendor_id, :body, :rating, :user_id)
  end

end
