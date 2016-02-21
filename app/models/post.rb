# Model to works with posts in database
class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :category
  has_many :comments
  has_one :seo_data

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :author, presence: true
  validates :resume, presence: true
  validates :published, presence: true
  validates :category_id, presence: true

end
