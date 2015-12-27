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
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to post_path(id: @post.id)
    else
      render template: 'posts/new'
    end
  end


  private

  def post_params
    post = params.require(:post).permit(:content, :title, :published, :resume, :author, :category)
    post['published'] = Time.parse("#{params['post']['published(3i)']}-#{params['post']['published(2i)']}-#{params['post']['published(1i)']} #{params['post']['published(4i)']}:#{params['post']['published(5i)']}")
    post['category'] = Category.find params['post']['category']
    post.delete('published(1i)')
    post.delete('published(2i)')
    post.delete('published(3i)')
    post.delete('published(4i)')
    post.delete('published(5i)')
    post
  end
end
