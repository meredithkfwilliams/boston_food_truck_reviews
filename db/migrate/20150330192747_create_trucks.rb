class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :truck_name, null: false
      t.integer :owner_id
      t.boolean :viewable, null: false, default: false

      t.timestamps
    end
  end
end
