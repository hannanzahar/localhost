class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :star
      t.references :user, index: true, foreign_key: true
      t.integer :reviewed_user
      
      t.timestamps null: false
    end
  end
end
