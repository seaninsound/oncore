class Venue < ActiveRecord::Base

	#add relations between other models
	belongs_to :user

	#validate certain things

	#validate certain things

	validates :name, presence: true
	validates :address, presence: true
	validates :price_in_pence, presence: true, numericality: { greater_than: 50 } 

	geocoded_by :address
	after_validation :geocode 

end
