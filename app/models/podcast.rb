require 'carrierwave/orm/activerecord'

class Podcast < ApplicationRecord
  mount_uploader :file, PodcastUploader

  serialize :external_links, Hash

  validates :title, presence: true
  validates :description, presence: true
  validates :file, presence: true
end
