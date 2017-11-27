class Product < ApplicationRecord
  validates :name, :amount, presence: true
  belongs_to :manager
  
  has_many :ordered_products
  has_many :orders, through: :ordered_products
end
