# frozen_string_literal: true

# :nodoc:
class Backend::ProductsController < ApplicationController
  before_action :redirect_if_no_admin
  before_action :set_product, only: %i[edit update destroy]

  # TODO: can I create before action with "set_response" (respond_with(@products)) ?

  def new
    @product = Product.new
    respond_with(@products)
  end

  def edit; end

  def create
    @product = Product.create(product_params)
    respond_with(@product)
  end

  def update
    @product.update(product_params)
    respond_with(@product)
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :category, :brand, :manufacturer, :year)
  end
end
