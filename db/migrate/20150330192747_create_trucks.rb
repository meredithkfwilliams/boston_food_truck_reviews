class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :truck_name, null: false
      t.integer :category_id
      t.integer :location_id
      t.integer :owner_id
      t.boolean :viewable

      t.timestamps
    end
  end
end
