# Controller to show posts for users
class PostsController < ApplicationController
  def show
    @post ||= Post.friendly.find(params[:id])
    if @post
      save_visit_blog(@post.id) 
      render layout: 'post'
    else
      render file: "#{Rails.root}/public/404", layout: false, status: :not_found
    end
  end
end
