class ResourcesController < ApplicationController
  RESOURCE_PER_PAGE = 10

  def index
    @resources = Resource
                   .actives
                   .order(created_at: :desc)
                   .page(params[:page] || 0)
                   .per(RESOURCE_PER_PAGE)
    @categories = categories_list
    @category = nil
    render layout: 'small_devise', template: "resources/mobile_index" if params[:subdomain]
  end

  def filter_by
  	p params[:category]
  	if params[:category] != "all"
  	  resources = Resource
        .actives
        .where(category: params[:category])
        .order(created_at: :desc)
      category = params[:category]
    else
    	resources = Resource
       .actives
       .order(created_at: :desc)
       .page(0)
       .per(RESOURCE_PER_PAGE)
      category = nil
    end
    categories = categories_list
    respond_to do |format|
      format.js {
      	render layout: nil,
      	  locals: {
            resources: resources,
            category: category,
            categories: categories
          }
      }
    end
  end

  def increment_stats
    resource = Resource.find_by_id(params[:id])
    if resource
      resource.downloads = resource.downloads.to_i + 1
      resource.save
    end
    render nothing: true
  end

  private

  def categories_list
    Resource.actives.map(&:category).uniq.sort
  end
end
