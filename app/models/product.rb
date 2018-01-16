class Product < ApplicationRecord
  validates :name, :amount, :price, :description, presence: true
  belongs_to :manager

  has_many :ordered_products
  has_many :orders, through: :ordered_products

  has_attached_file :avatar,
    styles: { medium: "300x200>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
