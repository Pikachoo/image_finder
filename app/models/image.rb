class Image < ActiveRecord::Base
  mount_uploader :file, ImageUploader

  has_and_belongs_to_many :tags

  scope :valid_file, -> {where.not(file: nil )}
  scope :last_items, -> (count){ includes(:tags).valid_file.order(:created_at).last(count)}
  scope :by_tag, -> (tag_id){joins(:tags).where('tags.id = ?', tag_id)}

end
