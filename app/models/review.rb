class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :vendor

  validates_presence_of :user_id
  validates_presence_of :vendor_id
  validates_presence_of :rating
  validates_presence_of :body
end
