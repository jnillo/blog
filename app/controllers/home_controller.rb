# Controller to build the initial view of the blog
class HomeController < ApplicationController
  layout 'home'
  POST_PAGE = 5

  def index
    @categories = Category.all.order(name: :desc)
    @posts = load_posts(params[:page])
    if params[:page].nil?
      @last_post = @posts.first
      #@posts = @posts[1..-1]
    end
  end

  def mobile_index
    @categories = Category.all.order(name: :desc)
    @posts = load_posts(params[:page])
    render template: 'home/index', layout: 'small_devise'
  end

  def load_info
    respond_to do |format|
      format.js {
        render json: { content: (render_to_string partial: params[:content], layout: false ) }
      }
    end
  end

  def about
    render template: 'about/index'
  end

  private

  def load_posts(page = 0)
    Post.joins(:category)
      .where('published <= ?', Time.zone.now)
      .select('posts.*, categories.name as category_name')
      .order(published: :desc)
      .page(page)
      .per(POST_PAGE)
  end
end
