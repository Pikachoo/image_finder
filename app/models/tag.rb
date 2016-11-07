class Tag < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_and_belongs_to_many :images

  def images_html_url
    tag_images_path(id)
  end
end
