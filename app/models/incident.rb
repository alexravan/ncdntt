class Incident < ActiveRecord::Base
	validates :user_id, presence: true
	validates :category, presence: true
	validates :location, presence: true
	validates :title, presence: true
	validates :severity, presence: true
    has_one :image, :video, :category
end
