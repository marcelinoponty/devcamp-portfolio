class Portfolio < ApplicationRecord
	validates_presence_of :title, :body, :main_image, :thumb_image

	def self.angular
		where(subtitle: 'Angular')
	end

	scope :rails, -> { where(subtitle: 'Rails') }

	def self.get_by_subtitle(subtitle)
		where(subtitle: subtitle)
	end
end
