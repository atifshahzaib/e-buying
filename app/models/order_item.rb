class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  after_create :decrement_product_quantity

  private
  def decrement_product_quantity
    product.update(quantity: product.quantity - 1)
  end
end
