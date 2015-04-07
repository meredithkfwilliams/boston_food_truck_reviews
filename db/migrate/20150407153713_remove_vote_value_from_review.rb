class RemoveVoteValueFromReview < ActiveRecord::Migration
  def up
    remove_column :reviews, :vote_value
  end

  def down
    add_column :reviews, :vote_value, :integer, default: 0
  end
end
