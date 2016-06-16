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

  def visits
    StatData.visit_post(id)
  end

  private

  def create_slug
    self.slug = I18n.transliterate(title)
    .sub(/\s|,|\./, '-')
    .downcase
  end
end
