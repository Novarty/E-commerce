class Order < ApplicationRecord
  belongs_to :user

  STATUSES = %w(in_progress sent done archived cancelled)
  validates :status, inclusion: STATUSES

  has_many :ordered_products
  has_many :products, through: :ordered_products
end
