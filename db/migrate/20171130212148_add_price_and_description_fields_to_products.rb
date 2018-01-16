class AddPriceAndDescriptionFieldsToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :price, :integer
    add_column :products, :description, :text
  end
end
