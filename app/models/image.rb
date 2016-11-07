class Image < ActiveRecord::Base
  mount_uploader :file, ImageUploader

  has_many :image_tags
  has_many :tags, through: :image_tags

  scope :valid_file, -> {where.not(file: nil )}
  scope :last_items, -> (count){ includes(:tags).valid_file.limit(count).order(created_at: :desc)}
  scope :by_tag, -> (tag_id){joins(:tags).where('tags.id = ?', tag_id)}
  scope :popular_items, ->(count){includes(:tags).valid_file.limit(count).order(open_amount: :desc)}

  def increase_open_amount
    self.open_amount = open_amount + 1
    self.save
  end

end
