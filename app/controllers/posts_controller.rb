class PostsController < ApplicationController
  before_filter :check_user, only: [:new, :create]
  layout 'clean_form', only: [:new]
  def show
    @post ||= Post.find(params[:id])
    render layout: 'post'
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params['post'])
    if @post.valid?
      @post.save
      redirect_to posts_path(@post.id)
    else
      render templaste: 'posts/new'
    end
  end

end
