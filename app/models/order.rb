class Order < ApplicationRecord
  has_many :users, through: :order_products
end
