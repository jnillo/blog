class Administration::PostsController < AdministrationController
  before_filter :check_user
  layout 'clean_form', only: [:new, :edit]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post ||= Post.find(params[:id])
    render layout: 'admin_post'
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
      render template: 'administration/posts/new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update_attributes(post_params)
      flash[:notice] = 'The post was updated successful.'
      redirect_to administration_posts_path
    else
      flash[:error] = 'Detected errors in the form. Please, review and fix them.'
      redirect_to edit_administration_post_path(id: post.id)
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      flash[:notice] = 'The post was deleted successful!'
    else
      flash[:error] = "The post couldn't be deleted. Please, try again."
    end
    redirect_to administration_posts_path()
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
