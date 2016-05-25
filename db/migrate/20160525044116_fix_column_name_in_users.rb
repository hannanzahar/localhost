class FixColumnNameInUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :coutry, :country
  end
end
