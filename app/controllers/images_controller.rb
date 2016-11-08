class ImagesController < ApplicationController
  def new
    @image = Image.new
    @last_images = Image.last_items(4)
    @popular_images = Image.popular_items(4)
  end

  def create
    @load_image = Images::CreateService.new.execute(params[:file])

    render json: @load_image.as_json
  end

  def index
    @images = Image.by_tag(params[:tag_id])
  end

  def show
    @image = Image.includes(:tags).find(params[:id])
  end
  private

  def image_params
    params.require(:images).permit(file: []) # and here
  end
end
