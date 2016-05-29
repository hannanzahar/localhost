class AddColumnFavesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :faves, :string
  end
end
