class Category < ActiveRecord::Base
  has_many :vendor_categories
  has_many :vendors, through: :vendor_categories

  validates :category_name, presence: true
end
