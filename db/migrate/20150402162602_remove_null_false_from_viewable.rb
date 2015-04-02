class RemoveNullFalseFromViewable < ActiveRecord::Migration
  def up
    change_column_default(:vendors, :viewable, nil)
    change_column :vendors, :viewable, :boolean, null: true
  end

  def down
    change_column :vendors, :viewable, :boolean, default: false, null: false
  end
end
