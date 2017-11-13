class CreateOrderProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :order_products do |t|
      t.belongs_to :order, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
