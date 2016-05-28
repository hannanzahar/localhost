class RenameReviewedUserInReviews < ActiveRecord::Migration
  def change
  	rename_column :reviews, :reviewed_user, :reviewer_id
  end
end
