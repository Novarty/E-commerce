class Order < ApplicationRecord
  belongs_to :user
  has_many :ordered_products
  has_many :products, through: :ordered_products

  STATUSES = %w(created in_progress sent done cancelled)
  validates :status, inclusion: STATUSES

  accepts_nested_attributes_for :ordered_products,
                                allow_destroy: true,
                                reject_if: :all_blank
end
