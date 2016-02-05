# Controller to build the initial view of the blog
class HomeController < ApplicationController
  layout 'home'

  def index
    @categories = Category.all.order(name: :desc)
    @posts = load_posts
  end

  private

  def load_posts
    Post.where('published <= ?', Time.zone.now+3.days).order(published: :desc)
  end
end
