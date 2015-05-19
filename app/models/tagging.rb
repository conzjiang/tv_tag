class Tagging < ActiveRecord::Base
  validates :tv_show_id, :tag_id, presence: true
  validates :tv_show_id, uniqueness: { scope: :tag_id }
end