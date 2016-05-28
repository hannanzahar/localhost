class AddColumnTipsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tips, :string
  end
end
