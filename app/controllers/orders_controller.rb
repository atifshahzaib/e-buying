class OrdersController < ApplicationController
  before_action :set_session, only: [:create]
  after_action :clear_cart, only: [:checkout]
  def index
    @products = Product.where(id: session[:product_ids])
  end

  def create
    if params[:product_id].present?
      if !session[:product_ids].include? params[:product_id]
        session[:product_ids] << params[:product_id]
      end
    end
    redirect_to root_path
  end

  def checkout
    if session[:user_id].present?
      create_order_items
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end
  private
  
  def create_order_items
    order = Order.create(user_id: session[:user_id])
    product_ids = session[:product_ids]
    product_ids.each do |pro_id|
      OrderItem.create(order_id: order.id, product_id: pro_id)
    end 
  end

  def set_session
    session[:product_ids] ||= []
  end

  def clear_cart
    session[:product_ids] = []
  end
end
