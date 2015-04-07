class Vendor < ActiveRecord::Base
  has_many :reviews
  has_many :vendor_categories
  has_many :categories, through: :vendor_categories
  has_many :vendor_location_schedules
  has_many :locations, through: :vendor_location_schedules

  validates_presence_of :vendor_name

  def self.approve(vendor)
    vendor.update(viewable: true)
  end
end
