class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user, presence: true
  validates :review, presence: true
  validates :user_id, uniqueness: {
    scope: :review_id, message: "User can only vote once per review."
  }

  def self.user_already_voted?(user, review)
    !Vote.where(user_id: user.id, review_id: review).empty?
  end

  def self.same_vote?(user, review, value)
    review_id = review.id
    !Vote.where(user_id: user.id, review_id: review_id, value: value).empty?
  end

  def self.destroy_user_vote(user, review)
    review_id = review.id
    vote = Vote.where(user_id: user.id, review_id: review_id)
    Vote.find(vote.first.id).destroy
  end
end
