class OrdersController < ApplicationController
  before_action :set_session, only: [:create]
  def index
    @products = Product.where(id: @product_ids.presence || session[:product_ids])
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
    if user_signed_in?
      Order.create_order_items session
      clear_cart
      redirect_to root_path
    else
      @product_ids = session[:product_ids]
      redirect_to login_path
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
  

  def set_session
    session[:product_ids] ||= []
  end

  def clear_cart
    session[:product_ids] = []
  end

end
