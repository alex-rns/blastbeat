# frozen_string_literal: true

# :nodoc:
class CreateStripeSubscriptionService
  def initialize(params, customer)
    @subscription_price = params[:subscription_price]
    @customer = customer
  end

  def call
    Stripe::Subscription.create({
                                  customer: @customer,
                                  items: [
                                    { price: @subscription_price }
                                  ]
                                })
  end
end
