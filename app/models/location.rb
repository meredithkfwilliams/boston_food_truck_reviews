class Location < ActiveRecord::Base
  has_many :vendor_location_schedules
  has_many :vendors, through: :vendor_location_schedules

  validates_presence_of :location_name
  validates_presence_of :latitude
  validates_presence_of :longitude
end
