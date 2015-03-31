class Location < ActiveRecord::Base
  has_many :vendor_location_schedules
  has_many :vendors, through: :vendor_location_schedules

  validates :location_name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
