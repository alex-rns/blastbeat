module ProductsHelper
  # def brands_list(products)
  #   products.map(&:brand).uniq
  # end
  def checked?(key, value)
    params[key].present? && params[key].include(value)
  end

  def uniq_brand
    Product.all.uniq { |p| p.brand }
  end
end
