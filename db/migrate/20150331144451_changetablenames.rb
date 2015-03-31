class Changetablenames < ActiveRecord::Migration
  def change
    rename_table :trucks, :vendors
    rename_table :truck_categories, :vendor_categories
    rename_table :truck_location_schedules, :vendor_location_schedules
  end
end
