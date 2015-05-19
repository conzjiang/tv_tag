describe TvShow do
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:tmdb_id) }
  it { should have_many(:taggings) }
  it { should have_many(:tags) }

end