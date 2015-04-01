class RemoveVendorsOwnerColumn < ActiveRecord::Migration

  def up
    remove_column :vendors, :owner_id, :string
  end

  def down
    add_column :vendors, :owner_id, :string
  end

end
