class CreateTruckCategories < ActiveRecord::Migration
  def change
    create_table :truck_categories do |t|
      t.integer :category_id, null: false
      t.integer :truck_id, null: false

      t.timestamps
    end
  end
end
