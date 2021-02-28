class Product < ApplicationRecord
  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize: "200x200"
  end
  validates :name, :price, :quantity, presence: true
  scope :available, -> { where("quantity > 0") }
end
