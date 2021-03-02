class ProductsController < ApplicationController
  def index
    @resources = Product.all.order(:created_at)
  end

  def new
    @resource = Product.new
  end

  def create
    @resource = Product.new(resource_params)
    if @resource.save
      redirect_to root_path, notice: 'Successfully Created'
    else
      redirect_to new_product_path
    end
  end

  def update
    if @resource.update(resource_params)
      redirect_to products_path, notice: 'Successfully Updated'
    else
      render :edit
    end
  end

  private

  def resource_params
    params.require(:product).permit(:name, :price, :quantity, :avatar)
  end

end