class UsersController < ApplicationController
  def new
    @resource = User.new
  end
  
  def create
    product_ids = session[:product_ids]
    resource = User.new(email: params[:user][:email], password: hash_password(params[:user][:password]))
    if resource.save
      session[:user_id] = resource.id
      session[:product_ids] = product_ids
      redirect_to root_path
    else
      render 'new'
    end
  end

  def logout
    session[:user_id] = []
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def hash_password(password)
    BCrypt::Password.create(password).to_s
  end
end
