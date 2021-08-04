# frozen_string_literal: true

# :nodoc:
class CreateStripeChargeService
  def initialize(customer, product)
    @customer = customer
    @product = product
  end

  def call
    Stripe::Charge.create({
                            amount: @product.price * 100,
                            currency: 'usd',
                            customer: @customer.id,
                            description: 'Test Charge'
                          })
  end
end
