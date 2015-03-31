class VendorLocationSchedule < ActiveRecord::Base
  belongs_to :location
  belongs_to :vendor

  validates :vendor_id, presence: true
  validates :location_id, presence: true
  validates :weekday, presence: true
end
