describe TvShow do
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:tmdb_id) }
end