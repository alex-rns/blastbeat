# frozen_string_literal: true

# :nodoc:
class FilterProductsQuery
  def initialize(products, params)
    @products = products
    @params = params
  end

  def call
    @products = sort_collection(@products, :brand) if @params[:brand].present?
    @products = sort_collection(@products, :category) if @params[:category].present?
    @products = sort_collection(@products, :manufacturer) if @params[:manufacturer].present?
    @products = @products.where('price >= ?', @params[:min_price]) if @params[:min_price].present?
    @products = @products.where('price <= ?', @params[:max_price]) if @params[:max_price].present?
    @products = @products.where('year >= ?', @params[:min_year]) if @params[:min_year].present?
    @products = @products.where('year <= ?', @params[:max_year]) if @params[:max_year].present?
    @products
  end

  private

  def sort_collection(collection, key)
    if @params[key].all?(&:blank?)
      collection
    else
      collection.where(key.to_s => @params[key])
    end
  end
end
