class ChangeUserTypeDefault < ActiveRecord::Migration
  def up
    change_column :users, :user_type, :string, null: false, default: "Member"
  end

  def down
    change_column :users, :user_type, :string, null: false
  end
end
