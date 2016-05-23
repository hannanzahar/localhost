class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
		t.string :first_name
		t.string :last_name
		t.string :gender
		t.integer :phone
		t.date :birthday
		t.string :email
		t.string :location
		t.string :interests
		t.string :past_activities
		t.string :emer_first_name
		t.string :emer_last_name
		t.string :emer_relation
		t.integer :emer_phone
		t.string :emer_email
		t.string :emer_nationality

      t.timestamps null: false
    end
  end
end
