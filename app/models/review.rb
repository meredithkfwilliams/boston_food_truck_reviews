class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :truck

  validates :user_id, presence: true
  validates :truck_id, presence: true
  validates :rating, presence: true
  validates :body, presence: true
end
