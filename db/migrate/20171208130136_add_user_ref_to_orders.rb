class AddUserRefToOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :user_id, :integer
    add_reference :orders, :user, foreign_key: true
  end
end
