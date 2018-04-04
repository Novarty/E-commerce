class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name,     null: false, default: ''
      t.integer :amount,  null: false, default: 0
      t.timestamps
    end
  end
end
