class TruckLocationSchedule < ActiveRecord::Base
  belongs_to :location
  belongs_to :truck

  validates :truck_id, presence: true
  validates :location_id, presence: true
  validates :weekday, presence: true
end
