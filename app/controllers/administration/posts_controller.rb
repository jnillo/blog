module Administration
  # Controller for admin  posts
  class PostsController < AdministrationController
    before_action :check_user

    before_action only: [:create, :update] do
      expire_fragment("home_blog_info") if fragment_exist?("home_blog_info")
    end

    layout 'administration', only: [:new, :edit]

    def index
      @posts = Post.all.order(published: :desc)
    end

    def show
      @post ||= Post.find(params[:id])
      @shares = StatData.shares_post(@post.id)
      render layout: 'admin_post'
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      if @post.valid?
        @post.save
        redirect_to administration_post_path(id: @post.id)
      else
        render template: 'administration/posts/new'
      end
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      post = Post.find(params[:id])
      if post.update_attributes!(post_params)
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
      redirect_to administration_posts_path
    end

    def generate_internal_link
      render json: Post.generate_internal_link(params[:title])
    end

    private

    def post_params
      post = if params["post"]["image"].is_a?(ActionDispatch::Http::UploadedFile)
               params.require(:post).permit(:content, :title, :published, :resume, :author, :tags, :category, :external_link, :image, :resource_id, :podcast_id)
             else
               params.require(:post).permit(:content, :title, :published, :resume, :author, :tags, :category, :external_link, :resource_id, :podcast_id)
             end
      post['published'] = build_published_date(params)
      post['category'] = Category.find params['post']['category'] if params['post']['category']
      post['content'] = save_images(post['content'], post['title'])
      remove_published_data(post)
    end

    def build_published_date(params)
      Time.parse("#{params['post']['published(1i)']}-"\
                 "#{params['post']['published(2i)']}-"\
                 "#{params['post']['published(3i)']}"\
                 " #{params['post']['published(4i)']}:"\
                 "#{params['post']['published(5i)']}")
      .in_time_zone
    end

    def remove_published_data(post)
      post.delete('published(1i)')
      post.delete('published(2i)')
      post.delete('published(3i)')
      post.delete('published(4i)')
      post.delete('published(5i)')
      post
    end

    def save_images(post_content, title)
      image_handler = ImageHandler.new(post_content, title)
      image_handler.parse
      image_handler.content
    end
  end
end
