# frozen_string_literal: true

# :nodoc:
class SubscriptionsController < ApplicationController
  def new; end

  def create
    customer = Stripe::Customer.create(email: current_user.email)
    token = CreateStripeTokenService.new(params).call
    Stripe::Customer.create_source(customer.id, { source: token.id })
    CreateStripeSubscriptionService.new(params, customer).call
    redirect_to checkout_success_url(title: 'subscription')
  end
end
