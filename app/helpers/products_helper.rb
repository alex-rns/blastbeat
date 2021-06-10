# frozen_string_literal: true

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

  def pass_image(product)
    if product.image.present?
      image_tag(product.image, class: 'img-fluid w-100')
    else
      image_pack_tag('media/src/images/photo-old-drum.jpg', class: 'img-fluid w-100')
    end
  end
end
