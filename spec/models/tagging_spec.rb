describe Tagging do
  it { should validate_presence_of(:tv_show_id) }
  it { should validate_presence_of(:tag_id) }
  it { should validate_uniqueness_of(:tv_show_id).scoped_to(:tag_id) }
end