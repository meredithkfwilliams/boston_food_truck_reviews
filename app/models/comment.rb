class Comment < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  validates :comment_body, presence: true
end
