class PodcastsController < ApplicationController
  def feed
    @podcasts = Podcast
               .order(created_at: :desc)
    respond_to do |format|
      format.rss { render :layout => false }
      format.xml { render :layout => false }
    end
  end
end
