class AddOwnerAndClaimedColumnToVendor < ActiveRecord::Migration
  def change
    add_column :vendors, :owner_id, :integer, default: nil
    add_column :vendors, :claimed_status, :string, default: 'Unclaimed'
  end
end
