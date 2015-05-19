class Api::TagsController < ApplicationController
  def create
    tag = Tag.find_or_create_by(tag_params)
    render json: tag
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end