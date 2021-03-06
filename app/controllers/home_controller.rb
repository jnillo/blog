# Controller to build the initial view of the blog
class HomeController < ApplicationController
  layout 'home'

  def index
    all_posts = load_posts
    @posts = all_posts[1..-1]
    @last_post = all_posts.first
    expires_in 24.hours, :public => true
  end

  def filter_by_category
    category = params[:category]
    posts = load_posts_with_category(params[:category])
    respond_to do |format|
      format.js { render layout: nil, locals: { category: category, posts: posts } }
    end
  end

  def mobile_index
    all_posts = load_posts
    @posts = all_posts
    @last_post = nil
    render layout: 'small_devise'
    expires_in 24.hours, :public => true
  end

  def load_info
    respond_to do |format|
      format.js {
        render json: { content: (render_to_string partial: params[:content], layout: false ) }
      }
    end
  end

  def services
    if params[:subdomain]
      render template: 'about/mobile_index', layout: 'small_devise'
    else
      render template: 'about/index'
    end
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
