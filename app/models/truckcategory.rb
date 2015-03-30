class TruckCategory < ActiveRecord::Base
  belongs_to :truck
  belongs_to :category

  validates :category_id, presence: true
  validates :truck_id, presence: true
end
