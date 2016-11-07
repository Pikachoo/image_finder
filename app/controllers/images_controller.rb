class ImagesController < ApplicationController
  def new
    @image = Image.new
    @last_images = Image.last_items(4)
    @popular_images = Image.popular_items(4)
    get_show_image(flash[:show_image_id])
  end

  def create
    Images::CreateService.new.execute(params[:file])
  end

  def index
    @images = Image.by_tag(params[:tag_id])
    get_show_image(flash[:show_image_id])
  end

  def show
    image = Image.find(params[:id])
    image.increase_open_amount

    redirect_to :back, flash: {show_image_id: params[:id]}
  end

  private

  def image_params
    params.require(:images).permit(file: []) # and here
  end
end
