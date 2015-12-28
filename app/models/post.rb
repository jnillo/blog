# Model to works with posts in database
class Post < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_one :seo_data

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :author, presence: true
  validates :resume, presence: true
  validates :published, presence: true
  validates :category_id, presence: true

  before_save :create_slug

  private

  def create_slug
    self.slug = I18n.transliterate(title)
                     .gsub(' ','-')
                     .gsub('.','')
                     .gsub(',','')
                     .downcase
  end
end
