class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :coutry, :string
    remove_column :users, :location, :string
  end
end