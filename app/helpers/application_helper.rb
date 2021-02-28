module ApplicationHelper
  def cart_count_over_one
    return session[:product_ids].length
  end

  def cart_has_items?
    if session[:product_ids].present?
      session[:product_ids].length > 0 ? true : false
    end
  end

  def user_signed_in?
    session[:user_id].present? ? true : false
  end
end
