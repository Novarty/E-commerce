class AddAmountToOrderedProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :ordered_products, :amount, :integer
  end
end
