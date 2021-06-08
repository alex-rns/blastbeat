module ProductsHelper

  def checked?(value, att)
    params[att].present? && params[att].include?(value.object.try(att))
  end

  def uniq_brand
    Product.order(:brand).uniq(&:brand)
  end

  def uniq_category
    Product.order(:category).uniq(&:category)
  end

  def uniq_manufacturer
    Product.order(:manufacturer).uniq(&:manufacturer)
  end

end
