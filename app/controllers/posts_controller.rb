# Controller to show posts for users
class PostsController < ApplicationController
  POST_PAGE = 12

  def index
    @all_posts = load_posts(params[:page])
    if params[:page].nil?
      @last_post = @all_posts.first
      @old_posts = @all_posts[1..-1]
    else
      @old_posts = @all_posts
    end
    respond_to do |format|
      format.html { render layout: 'blog' }
      format.js { render layout: nil, locals: {
          all_posts: @all_posts,
          last_post: @last_post,
          old_posts: @old_posts
        }
      }
    end
  end

  def mobile_index
    @title_list = "Blog"
    @all_posts = load_posts(params[:page])
    @old_posts = @all_posts
    respond_to do |format|
      format.html { render layout: params[:page] ? false : 'small_devise' }
      format.js { render layout: false }
    end
  end

  def show
    @post ||= Post.find_by_slug(params['slug'])
    if @post
      save_visit_blog(@post.id)
      @comments = @post.comments.approved
      @related_posts = @post.related_posts(2)
      render layout: 'post'
    else
      render file: "#{Rails.root}/public/404", layout: false, status: :not_found
    end
  end

  def filter_by_category
    category = params[:category]
    posts = load_posts_with_category(params[:category])
    respond_to do |format|
      format.js { render layout: nil, locals: { category: category, posts: posts } }
    end
  end

  def filter_by_tag
    @posts = Post.where('tags LIKE ?', "%#{params['tag']}%")
  end

  def mobile_show
    @post ||= Post.find_by_slug(params['slug'])
    if @post
      save_visit_blog(@post.id)
      @comments = @post.comments.approved
      @related_posts = @post.related_posts(2)
      render template: 'posts/show', layout: 'small_devise'
    else
      render file: "#{Rails.root}/public/404", layout: false, status: :not_found
    end
  end

  def social_stats
    save_share(params[:ref], params[:source])
  	render json: true
  end

  def new_like
    post = Post.find_by_id(params[:ref])
    post.likes += 1
    if post.save
      render body: nil, status: :ok
    else
      render body: nil, status: :bad_request
    end
  end

  def feed
    @posts = Post
               .where('published <= ?', Time.zone.now)
               .order(published: :desc)
    respond_to do |format|
      format.rss { render :layout => false }
      format.xml { render :layout => false }
    end
  end

  private

  def load_posts(page = 0)
    Post.joins(:category)
      .where('published <= ?', Time.zone.now)
      .select('posts.*, categories.name as category_name')
      .order(published: :desc)
      .page(page)
      .per(page ? POST_PAGE : 10)
  end

  def load_posts_with_category(category)
    Post.joins(:category)
      .where('published <= ?', Time.zone.now)
      .where(categories: { name: category })
      .select('posts.*, categories.name as category_name')
      .order(published: :desc)
      .page(0)
      .per(10000)
  end
end
