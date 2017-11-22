class AddManagerRefToProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :manager, foreign_key: true
  end
end
