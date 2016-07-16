# Controller to build the initial view of the blog
class HomeController < ApplicationController
  layout 'home'
  POST_PAGE = 5

  def index
    @categories = Category.all.order(name: :desc)
    @posts = load_posts(params[:page])
  end

  def load_info
    respond_to do |format|
      format.js {
        render json: { content: (render_to_string partial: params[:content], layout: false ) }
      }
    end
  end

  private

  def load_posts(page = 0)
    Post.where('published <= ?', Time.zone.now).order(published: :desc).page(page).per(POST_PAGE)
  end
end
