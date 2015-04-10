class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_integrity_of :avatar
  validates_processing_of :avatar

  has_many :votes
  has_many :reviews
  has_many :comments

  def admin?
    user_type == "Admin"
  end

  def member?
    user_type == "Member"
  end

  def vendor?
    user_type == "Vendor"
  end
end
