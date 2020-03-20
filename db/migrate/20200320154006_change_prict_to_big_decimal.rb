class ChangePrictToBigDecimal < ActiveRecord::Migration[5.2]
  def up
    change_column :products, :price, "numeric USING CAST(price AS numeric)"
  end

end
