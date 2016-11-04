class Image < ActiveRecord::Base
  mount_uploader :file, ImageUploader

  scope :valid_file, -> {where.not(file: nil )}

end
