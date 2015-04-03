class VendorLocationSchedule < ActiveRecord::Base
  belongs_to :location
  belongs_to :vendor

  validates_presence_of :vendor_id
  validates_presence_of :location_id
  validates_presence_of :weekday
end
