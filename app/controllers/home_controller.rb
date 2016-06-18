# Controller to build the initial view of the blog
class HomeController < ApplicationController
  layout 'home'
  POST_PAGE = 1

  def index
    @categories = Category.all.order(name: :desc)
    @posts = load_posts(params[:page])
  end

  private

  def load_posts(page = 0)
    Post.where('published <= ?', Time.zone.now).order(published: :desc).page(page).per(POST_PAGE)
  end
end
