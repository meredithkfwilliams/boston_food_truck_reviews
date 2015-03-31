class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :vendor

  validates :user_id, presence: true
  validates :vendor_id, presence: true
  validates :rating, presence: true
  validates :body, presence: true
end
