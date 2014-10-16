class ProductsController < ApplicationController

def index
  @products = Product.upcoming
end

def show
  @product = Product.find(params[:id])
end

def edit
  @product = Product.find(params[:id])
end

def update
  @product = Product.find(params[:id])
  @product.update(product_params)
  redirect_to @product
end

def new
  @product = Product.new
end

def create
  @product = Product.new(product_params)
  if @product.save
  redirect_to @product
else
  render :new
end
end


def destroy
  @product = Product.find(params[:id])
  @product.destroy
  redirect_to products_url
end


private

  def product_params
    params.require(:product).permit(:name, :description, :price, :releasing_on, :website, :industry, :image_file_name)
  end

  end

