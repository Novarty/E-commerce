class AddForeignKeysToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :manager_id, :integer
  end
end
