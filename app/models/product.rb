class Product < ApplicationRecord
  validates :name, :amount, :price, :description, presence: true
  belongs_to :manager

  has_many :ordered_products
  has_many :orders, through: :ordered_products, dependent: :destroy

  has_attached_file :avatar,
    styles: { medium: "266x200>", large: "532x400>" },
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
