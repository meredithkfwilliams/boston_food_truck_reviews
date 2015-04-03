class VendorCategory < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :category

  validates_presence_of :category_id
  validates_presence_of :vendor_id
end
