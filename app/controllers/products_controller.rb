# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  # TODO: can I create before action with "set_response" (respond_with(@products)) ?

  def index
    @products = FilterProductsQuery.new(Product.all, params).call
  end

  def show; end

  def new
    @product = Product.new
    respond_with(@products)
  end

  def create
    @product = Product.create(product_params)
    respond_with(@product)
  end

  def edit; end

  def update
    @product.update(product_params)
    respond_with(@product)
  end

  def destroy
    @product.destroy
    respond_with(@products, location: home_path)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :category, :brand, :manufacturer, :year)
  end
end
