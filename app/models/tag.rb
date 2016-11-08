class Tag < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_many :image_tags
  has_many :images, through: :image_tags

  scope :default, -> {Tag.find_by(name: 'others')}

  def images_html_url
    tag_images_path(id)
  end
end
