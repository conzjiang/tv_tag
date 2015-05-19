class Api::TvShowsController < ApplicationController
  def index
    @tv_shows = TvShow.includes(:tags)
    render :index
  end

  def create
    results = fetch_from_tmdb.results
    @tv_shows = TvShow.includes(:tags).create(results)
    marker.increment!

    @tv_shows = @tv_shows.select(&:valid?)
    render :index
  end

  def update
    @tv_show = TvShow.find(params[:id])
    @tv_show.update!(tv_params)
    head :no_content
  end

  private
  def fetch_from_tmdb
    FetchTmdb.new(marker)
  end

  def marker
    @marker ||= Marker.find_by(category: params[:category])
  end

  def tv_params
    params.require(:tv_show).permit(tag_ids: [])
  end
end