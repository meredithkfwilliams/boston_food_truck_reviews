class AddUniqueCategoryConstraint < ActiveRecord::Migration
  def up
    change_column :categories, :category_name, :string, null: false, unique: true
  end

  def down
    change_column :categories, :category_name, :string, null: false
  end
end
