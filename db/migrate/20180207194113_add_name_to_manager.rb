class AddNameToManager < ActiveRecord::Migration[5.1]
  def change
    add_column :managers, :name, :string
  end
end
