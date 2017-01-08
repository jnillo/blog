class Administration::ResourcesController < AdministrationController
  layout 'administration'

  before_action only: [:create, :update] do
    expire_fragment("resources_info") if fragment_exist?("resources_info")
  end

  def index
  	@resources = Resource.order(:created_at)
  end

  def show
  	@resource = Resource.find(params[:id])
  end

  def edit
  	@resource = Resource.find(params[:id])
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.valid?
    	@resource.save
    	redirect_to administration_resource_path(id: @resource.id)
    else
    	render template: 'administration/resources/new'
    end
  end

  def update
    resource = Resource.find(params[:id])
    if resource.update_attributes(resource_params)
      flash[:notice] = 'The resource was updated successful.'
      redirect_to administration_resources_path
    else
      flash[:error] = 'Detected errors in the form. Please, review and fix them.'
      redirect_to edit_administration_resources_path(id: post.id)
    end
  end

  def destroy
    resource = Resource.find(params[:id])
    if resource.destroy
      flash[:notice] = 'The resource was deleted successful!'
    else
      flash[:error] = "The resource couldn't be deleted. Please, try again."
    end
    redirect_to administration_resources_path
  end

  private

  def resource_params
    if params["resource"]["image"].is_a?(ActionDispatch::Http::UploadedFile)
      params.require(:resource).permit(:title, :description, :link, :image, :category, :status, :published)
    else
      params.require(:resource).permit(:title, :description, :link, :category, :status, :published)
    end
  end
end
