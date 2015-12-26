# Model to works with categories in database
class Category < ApplicationRecord
  has_many :posts

  validates :name, presence: true
end
