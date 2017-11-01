class Product < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true

  belongs_to :manager
end
