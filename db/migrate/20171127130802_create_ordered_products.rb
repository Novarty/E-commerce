class CreateOrderedProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :ordered_products do |t|
      t.references :product, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
