# frozen_string_literal: true

# :nodoc:
class CheckoutController < ApplicationController
  def stripe_side_payment
    @product = Product.find(params[:id])
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @product.title,
        description: @product.description,
        amount: @product.price,
        currency: 'usd',
        quantity: 1
      }],
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url
    )
    respond_to do |format|
      format.js
    end
  end
end
