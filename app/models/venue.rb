class Venue < ActiveRecord::Base

	#add relations between other models
	belongs_to :user
	has_many :orders
	
	#validate certain things

	#validate certain things

	validates :name, presence: true
	validates :address, presence: true
	validates :price_in_pence, presence: true, numericality: { greater_than: 50 } 

	geocoded_by :address
	after_validation :geocode 

	#add image attachment
	#in my styles I can use...
	# 720x240 --> 720 wide or 240 high
	# 720x --> 720 wide and however tall
	# x240 ---> however wide and 240 tall
	# 720x240 ---> crop to 720 by 240
	has_attached_file :image, styles: { large: "720x240#", medium: "240x240#", thumbnail: "60x60#" }

	#paperclip wants me to check it's an image
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
