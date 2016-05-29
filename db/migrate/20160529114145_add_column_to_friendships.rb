class AddColumnToFriendships < ActiveRecord::Migration
  def change
    add_column :friendships, :original, :boolean
  end
end
