# Controller to show posts for users
class PostsController < ApplicationController
  POST_PAGE = 10

  def index
    @posts = load_posts(params[:page])
    if params[:page].nil?
      @last_post = @posts.first
    end
    respond_to do |format|
      format.html { render layout: 'blog' }
      format.js { render layout: nil, locals: { last_post: @last_post, posts: @posts } }
    end
  end

  def show
    @post ||= Post.find_by_slug(params['slug'])
    if @post
      save_visit_blog(@post.id)
      @related_posts = Post.all.limit(2)
      render layout: 'post'
    else
      render file: "#{Rails.root}/public/404", layout: false, status: :not_found
    end
  end

  def filter_by_tag
    @posts = Post.where('tags LIKE ?', "%#{params['tag']}%")
  end

  def mobile_show
    @post ||= Post.find_by_slug(params['slug'])
    if @post
      save_visit_blog(@post.id)
      render template: 'posts/show', layout: 'small_devise'
    else
      render file: "#{Rails.root}/public/404", layout: false, status: :not_found
    end
  end

  def social_stats
    save_share(params[:ref], params[:source])
  	render json: true
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
