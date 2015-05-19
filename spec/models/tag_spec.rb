describe Tag do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should have_many(:taggings) }
  it { should have_many(:tv_shows) }
end