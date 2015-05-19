describe Marker do
  describe "#set_initial_page" do
    it "initializes with page 1 when page not set" do
      expect(Marker.new.page).to eq(1)
    end

    it "doesn't overwrite existing page with 1" do
      expect(Marker.new(page: 2).page).to eq(2)
    end
  end

  it "#increment! updates page + 1" do
    marker = Marker.create!(page: 5)

    expect {
      marker.increment!
    }.to change { marker.page }.by(1)
  end
end