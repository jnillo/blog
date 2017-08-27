class Administration::PodcastsController < ApplicationController
  layout 'administration'

  def index
    @podcasts = Podcast.all.order(:created_at)
  end

  def new
    @podcast = Podcast.new
  end

  def create
    @podcast = Podcast.new(podcast_params)
    if @podcast.valid?
      @podcast.save
      redirect_to administration_podcasts_path
    else
      redirect_to action: 'new'
    end
  end

  private

  def podcast_params
    params.require(:podcast).permit(:title, :description, :file, :external_links)
    params[:podcast][:external_links] = params[:podcast][:external_links].permit!.to_h
    params[:podcast].permit!
  end
end
