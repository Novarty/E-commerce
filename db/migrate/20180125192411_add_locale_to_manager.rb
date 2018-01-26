class AddLocaleToManager < ActiveRecord::Migration[5.1]
  def change
    add_column :managers, :locale, :string, default: "ru"
    add_column :users, :locale, :string, default: "ru"
  end
end
