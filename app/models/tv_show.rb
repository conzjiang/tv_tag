class TvShow < ActiveRecord::Base
  validates :title, presence: true
  validates :tmdb_id, uniqueness: true, allow_nil: true

  has_many :taggings
  has_many :tags, through: :taggings
end