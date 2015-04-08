class AddReviewVoteValueColumn < ActiveRecord::Migration
  def change
    add_column :reviews, :vote_value, :integer, default: 0
  end
end
