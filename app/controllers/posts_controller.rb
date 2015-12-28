# Controller to show posts for users
class PostsController < ApplicationController
  def show
    @post ||= Post.find_by_slug(params[:slug])
    render layout: 'post'
  end
end
