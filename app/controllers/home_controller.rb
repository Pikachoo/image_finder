class HomeController < ApplicationController
  def index
    @images = Image.popular_items(14)
  end
end
