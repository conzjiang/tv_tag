class Api::TvShowsController < ApplicationController
  def create
    results = fetch_from_tmdb.results
    new_shows = TvShow.create(results)
    marker.increment!
    render json: new_shows
  end

  private
  def fetch_from_tmdb
    FetchTmdb.new(marker)
  end

  def marker
    @marker ||= Marker.find_by(category: params[:category])
  end
end