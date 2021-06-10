# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = FilterProductsQuery.new(Product.all, params).call
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    respond_with(@products)
  end

  def create
    @product = Product.create(product_params)
    respond_with(@product, location: home_path)
  end

  def edit; end

  def update; end

  def destroy; end

  def product_params
    params.require(:product).permit(:title, :description, :price, :category, :brand, :manufacturer, :year)
  end
end
