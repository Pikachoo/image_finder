class Tag < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_many :image_tags
  has_many :images, through: :image_tags

  def images_html_url
    tag_images_path(id)
  end
end
