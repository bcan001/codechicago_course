class User < ActiveRecord::Base
	has_secure_password
	validates(:email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create })
	validates(:username, presence: true)



	has_many(:posts, dependent: :destroy)
	has_many(:comments, dependent: :destroy)


	# has_secure_password does give the code below automatically
	# getter method for the password
	def password
  	@password ||= BCrypt::Password.new(password_digest)
	end
	# setter method for the password
	def password=(new_password)
  	@password = BCrypt::Password.create(new_password)
  	self.password_digest = @password
	end


	has_many :friendships
	has_many :friends, :through => :friendships

	# determine what other users have added a user as a friend
	has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
	has_many :inverse_friends, :through => :inverse_friendships, :source => :user



end