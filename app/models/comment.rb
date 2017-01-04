# Model to works with comments in database
class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :reply_to, class_name: 'Comment', foreign_key: 'reply_to_id'
  has_one :reply, class_name: 'Comment', foreign_key: 'reply_to_id'

  validates :content, presence: true
  validates :name, presence: true
  validates :email, presence: true
  validates :post_id, presence: true

  scope :approved, -> { where("status = ? AND reply_to_id IS NULL", true).order("created_at desc")}
  scope :pending, -> { where("status = ? AND reply_to_id IS NULL", false).order("created_at desc")}
end
