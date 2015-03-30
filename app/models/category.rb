class Category < ActiveRecord::Base
  has_many :truck_categories
  has_many :trucks, through: :truck_categories

  validates :category_name, presence: true
end
