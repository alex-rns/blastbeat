# frozen_string_literal: true

# :nodoc:
class PaymentsController < ApplicationController
  before_action :set_product

  def new; end

  def create
    customer = Stripe::Customer.create(email: current_user.email)
    token = CreateStripeTokenService.new(params).call
    Stripe::Customer.create_source(customer.id, { source: token.id })
    CreateStripeChargeService.new(customer, @product).call
    redirect_to checkout_success_url(title: @product.title)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
