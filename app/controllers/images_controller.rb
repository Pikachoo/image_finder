class ImagesController < ApplicationController
  def new
    @image = Image.new
    @last_images = Image.valid_file.order(:created_at).last(4)
  end

  def create
    Image.create(file: params[:file])
  end

  private

  def image_params
    params.require(:images).permit(file: []) # and here
  end
end
