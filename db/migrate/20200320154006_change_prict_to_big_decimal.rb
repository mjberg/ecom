class ChangePrictToBigDecimal < ActiveRecord::Migration[5.2]
  def up
    change_column :products, :price, :integer
    add_monetize :products, :price

  end

end
