# Controller to show posts for users
class PostsController < ApplicationController
  def show
    @post ||= Post.find(params[:id])
    render layout: 'post'
  end
end
