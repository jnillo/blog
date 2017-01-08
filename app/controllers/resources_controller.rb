class ResourcesController < ApplicationController
  RESOURCE_PER_PAGE = 10

  include Interactions

  def index
    @resources = resources_list
    @categories = categories_list
    @category = nil
    render layout: 'small_devise', template: "resources/mobile_index" if params[:subdomain]
  end

  def filter_by
  	p params[:category]
  	if params[:category] != "all"
  	  resources = resources_list(category: params[:category])
      category = params[:category]
    else
    	resources = resources_list
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

  def new_like
    resource = Resource.find_by_id(params[:ref])
    resource.likes += 1
    if resource.save
      cookies_likes(resource.link)
      render body: nil, status: :ok
    else
      render body: nil, status: :bad_request
    end
  end

  private

  def categories_list
    Resource.actives.map(&:category).uniq.sort
  end

  def resources_list(filter = nil)
    resources = Resource
      .actives
      .order(published: :desc)
    resources = resources.where(filter) if filter

    resources.page(params[:page] || 0)
      .per(RESOURCE_PER_PAGE)
  end
end
