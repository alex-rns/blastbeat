# frozen_string_literal: true

# :nodoc:
class SubscriptionsController < ApplicationController
  def new; end

  def create
    customer = Stripe::Customer.create(email: current_user.email)
    token = Stripe::Token.create(card: { number: params[:number],
                                         exp_month: params[:exp_month],
                                         exp_year: params[:exp_year],
                                         cvc: params[:cvc] })
    Stripe::Customer.create_source(customer.id, { source: token.id })
    Stripe::Subscription.create({
                                  customer: customer,
                                  items: [
                                    { price: params[:subscription_price] }
                                  ]
                                })
    redirect_to checkout_success_url(title: 'subscription')
  end
end
