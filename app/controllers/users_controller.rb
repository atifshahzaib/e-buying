class UsersController < ApplicationController
  def new
    @resource = User.new
  end

  def create
    product_ids = session[:product_ids]
    resource = User.new(user_params)
    if resource.save
      session[:user_id] = resource.id
      session[:product_ids] = product_ids
      redirect_to root_path
    else
      render 'new'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
