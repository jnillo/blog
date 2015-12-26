# Model to works with comments in database
class Comment < ApplicationRecord
  belongs_to :post

  validates :user, presence: true
  validates :content, presence: true
  validates :post_id, presence: true
end
