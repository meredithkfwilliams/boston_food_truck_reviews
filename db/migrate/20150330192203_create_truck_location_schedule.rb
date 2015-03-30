class CreateTruckLocationSchedule < ActiveRecord::Migration
  def change
    create_table :truck_location_schedules do |t|
      t.integer :truck_id, null: false
      t.integer :location_id, null: false
      t.string :weekday, null: false

      t.timestamps
    end
  end
end
