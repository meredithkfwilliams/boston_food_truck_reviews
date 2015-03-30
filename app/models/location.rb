class Location < ActiveRecord::Base
  has_many :truck_location_schedules
  has_many :trucks, through: :truck_location_schedules

  validates :location_name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
