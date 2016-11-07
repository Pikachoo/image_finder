class ChangeImagesTags < ActiveRecord::Migration[5.0]
  def change
    add_column :images_tags, :score, :float, default: 0
  end
end
