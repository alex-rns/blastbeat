class ProductsController < ApplicationController
  def index
    @products = Product.all
    @products = @products.where(brand: params[:brand]) if params[:brand].present?
    # respond_with(@products)
  end
end
