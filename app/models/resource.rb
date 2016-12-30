require 'carrierwave/orm/activerecord'
class Resource < ApplicationRecord
	mount_uploader :image, ResourceImageUploader

	has_many :posts

  scope :actives, -> { where(status: true) }
end
