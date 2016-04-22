class Restaurant < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	searchkick

	has_many :reviews, as: :reviewable, dependent: :destroy

	validates :name, :address, presence: true

	acts_as_votable
end
