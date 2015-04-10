class Comment < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  validates :comment_body, presence: true
  validates :review, presence: true
  validates :user, presence: true
end
