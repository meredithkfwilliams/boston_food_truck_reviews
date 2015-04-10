class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :vendor
  has_many :votes
  has_many :comments

  validates_presence_of :user_id
  validates_presence_of :vendor_id
  validates_presence_of :rating
  validates_presence_of :body

  def vote_value
    points = votes.pluck(:value)
    points.sum
  end
end
