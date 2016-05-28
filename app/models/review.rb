class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :reviewer, class_name: 'User', foreign_key: 'reviewer_id'
 
end
