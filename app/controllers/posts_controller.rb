# Controller to show posts for users
class PostsController < ApplicationController
  def show
    @post ||= Post.find_by_slug(params[:slug])
    if @post
      save_visit_blog(@post.id)
      @related_posts = Post.all.limit(2)
      render layout: 'post'
    else
      render file: "#{Rails.root}/public/404", layout: false, status: :not_found
    end
  end

  def mobile_show
    @post ||= Post.find_by_slug(params[:slug])
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
end
