class HomeController < ApplicationController
  def index
    @images = Image.last_items(14)
    get_show_image(flash[:show_image_id])
  end
end
