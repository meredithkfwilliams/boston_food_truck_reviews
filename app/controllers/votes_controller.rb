class VotesController < ApplicationController
  def create
    @vendor = Vendor.find(params[:vendor_id])
    @review = @vendor.reviews.find(params[:review_id])

    if Vote.user_already_voted(current_user, @review.id).empty? == false
      Vote.destroy_user_vote(current_user, @review)
      @review = @vendor.reviews.find(params[:review_id])
    end

    vote = @review.votes.new(value: params[:vote][:vote_value])
    vote.user = current_user

    if vote.save
      review = @review
      review.update_attributes(vote_value: review.vote_value += vote.value)
      flash[:notice] = 'Thanks for voting!'
      redirect_to vendor_path(@vendor), format: "html"
    else
      redirect_to vendor_path(@vendor)
    end
  end
end
