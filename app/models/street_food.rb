class StreetFood < ActiveRecord::Base
	mount_uploader :streetfoods, StreetfoodsUploader

	searchkick

	has_many :reviews, as: :reviewable, dependent: :destroy

	validates :name, :address, presence: true
	acts_as_votable



end
