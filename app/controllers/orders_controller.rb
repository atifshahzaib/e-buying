class OrdersController < ApplicationController
  before_action :set_session, only: [:create]
  after_action :decrement_quantity, only: [:checkout]
  def index
    if @product_ids.present?
      @products = Product.where(id: @product_ids)
    else
      @products = Product.where(id: session[:product_ids])
    end
  end

  def create
    if params[:product_id].present?
      if !session[:product_ids].include? params[:product_id]
        session[:product_ids] << params[:product_id]
        flash[:notice] = 'Added to cart'
      else
        flash[:notice] = 'Already in cart'
      end
    end
    redirect_to root_path
  end

  def checkout
    if session[:user_id].present?
      create_order_items
      clear_cart
      redirect_to root_path
    else
      @product_ids = session[:product_ids]
      redirect_to new_user_path
    end
  end

  def remove_product_from_cart
    if params["product_id"].present?
      session[:product_ids].delete(params["product_id"])
      flash[:notice] = 'Removed from cart'
    end
    redirect_to orders_path
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

  def decrement_quantity
    product_ids = session[:product_ids]
    if(product_ids)
      product_ids.each do |pro_id|
        product = Product.find(pro_id)
        product.update(quantity: product.quantity-1)
      end
    end
  end
end
