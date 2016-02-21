# Controller to blog
class BlogController < ApplicationController
  layout 'blog'
  
  def index
    @categories = Category.all.order(name: :desc)
    @posts = load_posts
  end

  private
  
  def load_posts
    Post.where('published <= ?', Time.zone.now).order(published: :desc)
  end
end
