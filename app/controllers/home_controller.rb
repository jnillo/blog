class HomeController < ApplicationController
  layout 'home'

  def index
    @categories = Category.all.order(name: :desc)
    @posts = load_posts
  end

  private

  def load_posts
    Post.all.order(published: :desc)
  end
end
