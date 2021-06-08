class FilterProductsQuery

  def initialize(products, params)
    @products = products
    @params = params
  end

  def call
    @params[:brand] == [""] ? @products : @products = @products.where(brand: @params[:brand]) if @params[:brand].present?
    @params[:category] == [""] ? @products : @products = @products.where(category: @params[:category]) if @params[:category].present?
    @params[:manufacturer] == [""] ? @products : @products = @products.where(manufacturer: @params[:manufacturer]) if @params[:manufacturer].present?
    @products = @products.where("price >= ?", @params[:min_price]) if @params[:min_price].present?
    @products = @products.where("price <= ?", @params[:max_price]) if @params[:max_price].present?
    @products = @products.where("year >= ?", @params[:min_year]) if @params[:min_year].present?
    @products = @products.where("year <= ?", @params[:max_year]) if @params[:max_year].present?
    @products
  end
end