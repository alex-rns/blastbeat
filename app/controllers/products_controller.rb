class ProductsController < ApplicationController
  def index
    @products = FilterProductsQuery.new(Product.all, params).call
  end

  def new
    @product = Product.new
    respond_with(@products)
  end

  def create
    @product = Product.create(product_params)
    redirect_to home_path
    # respond_with(@product)
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :category, :brand, :manufacturer, :year)
  end
end
