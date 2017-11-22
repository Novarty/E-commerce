class Product < ApplicationRecord
  validates :name, :amount, presence: true

  belongs_to :manager
end
