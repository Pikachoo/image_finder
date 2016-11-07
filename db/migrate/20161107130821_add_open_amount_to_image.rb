class AddOpenAmountToImage < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :opent_amount, :integer, default: 0
  end
end
