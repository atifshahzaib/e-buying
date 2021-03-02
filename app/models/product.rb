class Product < ApplicationRecord
  has_one_attached :avatar
  has_many :order_items, dependent: :nullify
  validates :name, :price, :quantity, presence: true
  scope :available, -> { where("quantity > 0") }
end
