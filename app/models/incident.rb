class Incident < ActiveRecord::Base
	belongs_to :user
	validates :category, presence: true
	validates :location, presence: true
	validates :title, presence: true
	validates :severity, presence: true
	 # This method associates the attribute ":avatar" with a file attachment
	 # belongs_to :category
	has_attached_file :media, styles: {
		thumb: '100x100>',
		square: '200x200#',
		medium: '300x300>'
	}
	# Validate the attached image is image/jpg, image/png, etc
	validates_attachment_content_type :media, :content_type => /\Aimage\/.*\Z/
end
