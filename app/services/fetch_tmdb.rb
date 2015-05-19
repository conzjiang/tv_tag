require 'addressable/uri'

class FetchTmdb
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def results
    data.map { |result| { tmdb_id: result["id"], name: result["name"] } }
  end

  private
  def tmdb_uri
    Addressable::URI.new(
      scheme: "http",
      host: "api.themoviedb.org",
      path: "3/tv/#{marker.category}",
      query_values: {
        api_key: ENV["TMDB_KEY"],
        page: marker.page
      }
    ).to_s
  end

  def data
    @data ||= JSON.parse(RestClient.get(tmdb_uri))["results"]
  end
end