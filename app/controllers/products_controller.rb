class ProductsController < ApplicationController
  def index
    @resources = Product.available
  end

  def new
  @resource = Product.new
  end

  def create
    @resource = Product.new(resource_params)
    if @resource.save
      render json: [ "Successfully Created" ], status: 200
    else
      render :new
    end
  end

  def show
    @resource = Product.find(params[:id])
  end

  def edit
  end

  def update
    if @resource.update(resource_params)
      render json: [ "Successfully Updated" ], status: 200
    else
      render :edit
    end
  end

  private

  def resource_params
    params.require(product).permit(:name, :price, :quantity, images: [])
  end
end
