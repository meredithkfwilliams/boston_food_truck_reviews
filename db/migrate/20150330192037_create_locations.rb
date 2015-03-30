class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :location_name
      t.float :lat_long

      t.timestamps
    end
  end
end
