class AddIndexToTvShowTmdbId < ActiveRecord::Migration
  def change
    add_index :tv_shows, :tmdb_id
  end
end
