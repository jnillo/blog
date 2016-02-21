# Model to works with categories in database
class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :posts

  validates :name, presence: true
end
