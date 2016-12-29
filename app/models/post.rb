require 'carrierwave/orm/activerecord'
# Model to works with posts in database
class Post < ApplicationRecord
  mount_uploader :image, PostImageUploader

  belongs_to :category
  has_many :comments
  has_one :seo_data
  belongs_to :resource

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :author, presence: true
  validates :resume, presence: true
  validates :published, presence: true
  validates :category_id, presence: true

  before_save :create_slug

  scope :with_category, -> (category_id){
    joins(:category).where(categories: { id: category_id})
  }

  def self.generate_internal_link(title)
    title.gsub! /\s*@\s*/, " at "
    title.gsub! /\s*&\s*/, " and "
    title = I18n.transliterate(title)
    title = title.strip
    title.gsub! /\s*[^A-Za-z0-9\.\_]\s*/, '-'
    title.gsub! /_+/,"-"
    title = title[1..-1] if title.first == '-'
    title = title[0..-2] if title.last == '-'
    title.downcase
  end

  def status
    published < Time.zone.now ? 'Live' : 'Pending'
  end

  def first_image
    ImageHandler.new(content).first_image || nil
  end

  def visits
    StatData.visit_post(id)
  end

  def related_posts(count = 2)
    Post.with_category(category_id)
      .where('posts.id != ?', id)
      .order(created_at: :desc)
      .limit(count)
  end

  private

  def create_slug
    self.slug = Post.generate_internal_link(title)
  end
end