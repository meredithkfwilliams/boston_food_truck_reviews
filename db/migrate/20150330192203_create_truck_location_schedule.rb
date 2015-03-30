class CreateTruckLocationSchedule < ActiveRecord::Migration
  def change
    create_table :truck_location_schedules do |t|
      t.integer :truck_id
      t.integer :location_id
      t.date :date

      t.timestamps
    end
  end
end
