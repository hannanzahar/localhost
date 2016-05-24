class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birthdate, :date
    add_column :users, :location, :string
    add_column :users, :bio, :string
    add_column :users, :interests, :string
    add_column :users, :emer_contacts, :string
    add_column :users, :emer_phone, :string
    add_column :users, :emer_first, :string
    add_column :users, :emer_last, :string
    add_column :users, :emer_relation, :string
    add_column :users, :emer_address, :string
    
  end
end
