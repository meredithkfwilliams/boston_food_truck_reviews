class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user, presence: true
  validates :review, presence: true
  validates :user_id, uniqueness: {
    scope: :review_id, message: "User can only vote once per review."
  }

  def self.user_already_voted(user, review)
    Vote.where("(user_id = #{user.id} AND review_id = #{review})")
  end

  def self.destroy_user_vote(user, review)
    review_id = review.id
    vote = Vote.where("(user_id = #{user.id} AND review_id = #{review_id})")
    review = Review.find(review_id)
    review.update_attributes(vote_value: review.vote_value -= vote.first.value)
    Vote.find(vote.first.id).destroy
  end
end
