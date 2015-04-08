class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :votes
  has_many :reviews
  
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
