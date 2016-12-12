# Controller to build the initial view of the blog
class HomeController < ApplicationController
  layout 'home'

  def index
    all_posts = load_posts
    @posts = all_posts[1..-1]
    @last_post = all_posts.first
  end

  def filter_by_category
    category = params[:category]
    posts = load_posts_with_category(params[:category])
    respond_to do |format|
      format.js { render layout: nil, locals: { category: category, posts: posts } }
    end
  end

  def mobile_index
    @posts = load_posts(params[:page])
    if params[:page].nil?
      @last_post = @posts.first
    end
    respond_to do |format|
      format.html { render template: 'home/index', layout: 'small_devise' }
      format.js { render layout: nil, locals: { last_post: @last_post, posts: @posts } }
    end
  end

  def load_info
    respond_to do |format|
      format.js {
        render json: { content: (render_to_string partial: params[:content], layout: false ) }
      }
    end
  end

  def services
    render template: 'about/index'
  end

  private

  def load_posts(page = 0)
    Post.joins(:category)
      .where('published <= ?', Time.zone.now)
      .select('posts.*, categories.name as category_name')
      .order(published: :desc)
      .limit(4)
  end

end
