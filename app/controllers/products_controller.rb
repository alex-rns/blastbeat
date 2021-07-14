# frozen_string_literal: true

# :nodoc:
class ProductsController < ApplicationController

  def index
    @products = FilterProductsQuery.new(Product.all, params).call
  end

  def show
    @product = Product.find(params[:id])
  end
end
