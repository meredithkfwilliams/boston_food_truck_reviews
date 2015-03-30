class Truck < ActiveRecord::Base
  has_many :reviews
  has_many :truck_categories
  has_many :categories, through: :truck_categories
  has_many :truck_location_schedules
  has_many :locations, through: :truck_location_schedules

  validates :truck_name, presence: true
  validates :viewable, presence: true
end
