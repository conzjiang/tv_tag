class Marker < ActiveRecord::Base
  after_initialize :set_initial_page

  private
  def set_initial_page
    self.page ||= 1
  end
end