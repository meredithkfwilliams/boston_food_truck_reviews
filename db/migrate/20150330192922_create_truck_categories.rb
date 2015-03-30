class CreateTruckCategories < ActiveRecord::Migration
  def change
    create_table :truck_categories do |t|
      t.string :category_id
      t.integer :truck_id

      t.timestamps
    end
  end
end
