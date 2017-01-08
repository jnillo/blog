require 'carrierwave/orm/activerecord'
class Resource < ApplicationRecord
	mount_uploader :image, ResourceImageUploader

	has_many :posts

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :link, presence: true
  validates :image, presence: true
  validates :published, presence: true

  scope :actives, -> { where("status = ? AND published <= ?", true, Time.now) }
end
