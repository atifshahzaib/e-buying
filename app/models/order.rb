class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  def self.create_order_items session
    order = Order.create(user_id: session[:user_id])
    product_ids = session[:product_ids]
    product_ids.each do |pro_id|
      OrderItem.create(order_id: order.id, product_id: pro_id)
    end 
  end
end
