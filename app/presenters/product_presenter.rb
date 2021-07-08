# frozen_string_literal: true

# :nodoc:
class ProductPresenter
  include ActionView::Helpers

  def initialize(product)
    @product = product
  end

  def new_product_marker
    @product.created_at >= 10.hour.ago ? 'warning' : 'black'
  end
end
