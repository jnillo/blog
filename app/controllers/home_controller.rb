# Controller to build the initial view of the blog
class HomeController < ApplicationController
  layout 'home'

  def index
    @posts = recent_posts
  end

  private

  def recent_posts
  	Post.order(:created).limit(3)
  end
end
