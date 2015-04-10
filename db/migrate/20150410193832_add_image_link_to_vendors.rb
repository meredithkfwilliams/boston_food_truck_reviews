class AddImageLinkToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :image, :string
  end
end
