class Order < ActiveRecord::Base

	#relationships
	belongs_to :venue
	belongs_to :user
end
