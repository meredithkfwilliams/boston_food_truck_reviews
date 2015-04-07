class VotesController < ApplicationController
  def create
    @vendor = Vendor.find(params[:vendor_id])
    @review = @vendor.reviews.find(params[:review_id])
    @value = params[:vote][:value]

    if !Vote.user_already_voted(current_user, @review.id).empty?
      if !Vote.same_vote(current_user, @review, @value)
        flash[:notice] = 'You already did that!'
      else Vote.same_vote(current_user, @review, @value)
        Vote.destroy_user_vote(current_user, @review)
        @review = @vendor.reviews.find(params[:review_id])
      end
    end

      vote = @review.votes.new(vote_params)
      vote.user = current_user
      if vote.save
        flash[:notice] = 'Thanks for voting!'
      end
    redirect_to vendor_path(@vendor)
  end

  protected

  def vote_params
    params.require(:vote).permit(:value)
  end
end
