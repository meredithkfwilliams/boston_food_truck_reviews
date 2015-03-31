class VendorCategory < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :category

  validates :category_id, presence: true
  validates :vendor_id, presence: true
end
