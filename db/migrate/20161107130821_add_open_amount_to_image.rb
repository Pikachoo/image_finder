class AddOpenAmountToImage < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :open_amount, :integer, default: 0
  end
end
