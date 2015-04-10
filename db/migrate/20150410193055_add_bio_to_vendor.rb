class AddBioToVendor < ActiveRecord::Migration
  def change
    add_column :vendors, :bio, :string
  end
end
