class ImagesController < ApplicationController
  def new
    @image = Image.new
    @last_images = Image.last_items(4)
    get_show_image(flash[:show_image_id])
  end

  def create
    Image.create(file: params[:file])
  end

  def index
    @images = Image.by_tag(params[:tag_id])
    get_show_image(flash[:show_image_id])
  end

  def show
    @images = Image.by_tag(params[:tag_id])
    redirect_to :back, flash: {show_image_id: params[:id]}
  end

  private

  def image_params
    params.require(:images).permit(file: []) # and here
  end
end
