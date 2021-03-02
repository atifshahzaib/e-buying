class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product, dependent: :nullify
end
