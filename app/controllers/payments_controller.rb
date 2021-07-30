# frozen_string_literal: true

# :nodoc:
class PaymentsController < ApplicationController
  before_action :set_product

  def new; end

  def create
    customer = Stripe::Customer.create(email: current_user.email)
    token = Stripe::Token.create(card: { number: params[:number],
                                         exp_month: params[:exp_month],
                                         exp_year: params[:exp_year],
                                         cvc: params[:cvc] })
    Stripe::Customer.create_source(customer.id, { source: token.id })
    Stripe::Charge.create({
                            amount: @product.price * 100,
                            currency: 'usd',
                            customer: customer.id,
                            description: 'Test Charge'
                          })
    redirect_to checkout_success_url(title: @product.title)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
