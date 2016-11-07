class ChangeTag < ActiveRecord::Migration[5.0]
  def change
    remove_column :tags, :created_by
  end
end
