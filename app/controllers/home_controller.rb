class HomeController < ApplicationController
  def index
    @images = Image.popular_items(14)
    get_show_image(flash[:show_image_id])
  end
end
