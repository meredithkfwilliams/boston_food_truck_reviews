class UpdateColumnNames < ActiveRecord::Migration
  def change
    rename_column :reviews, :truck_id, :vendor_id
    rename_column :vendor_categories, :truck_id, :vendor_id
    rename_column :vendor_location_schedules, :truck_id, :vendor_id
    rename_column :vendors, :truck_name, :vendor_name
  end
end
