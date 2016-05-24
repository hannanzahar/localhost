class ChangeColumnNameInUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :emer_contacts, :emer_contact
  end
end
