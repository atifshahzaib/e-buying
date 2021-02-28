class Product < ApplicationRecord
  has_one_attached :avatar
  validates :name, :price, :quantity, presence: true
  scope :available, -> { where("quantity > 0") }
end
