class CreateTvShows < ActiveRecord::Migration
  def change
    create_table :tv_shows do |t|
      t.integer :tmdb_id
      t.string :title
      t.timestamps
    end

    add_index :tv_shows, :title
  end
end
