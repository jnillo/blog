# Model to works with posts in database
class Post < ApplicationRecord
  belongs_to :category
  has_many :comments

  validates :title, presence: true
  validates :content, presence: true
  validates :author, presence: true
  validates :resume, presence: true
  validates :published, presence: true
  validates :category_id, presence: true
end
