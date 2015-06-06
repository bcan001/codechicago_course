class Post < ActiveRecord::Base
	has_many(:comments)



	#belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
	belongs_to(:user)
	#validates :user_id, presence: true
end
