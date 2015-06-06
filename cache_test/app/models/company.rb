class Company < ActiveRecord::Base
	validates(:name, presence: true, uniqueness: true)
	has_many(:employees, dependent: :destroy)

	def to_s
		name
	end


end
