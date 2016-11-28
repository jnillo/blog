require 'carrierwave/orm/activerecord'
# Model to works with posts in database
class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

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

  def self.generate_internal_link(title)
    title.gsub! /\s*@\s*/, " at "
    title.gsub! /\s*&\s*/, " and "
    title = I18n.transliterate(title)
    title = title.strip
    title.gsub! /\s*[^A-Za-z0-9\.\_]\s*/, '-'
    title.gsub! /_+/,"-"
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

  private

  def create_slug
    self.slug = Post.generate_internal_link(title)
  end
end