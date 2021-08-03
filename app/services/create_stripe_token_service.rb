# frozen_string_literal: true

# :nodoc:
class CreateStripeTokenService
  def initialize(params)
    @number = params[:number]
    @exp_month = params[:exp_month]
    @exp_year = params[:exp_year]
    @cvc = params[:cvc]
  end

  def call
    Stripe::Token.create(card: { number: @number,
                                 exp_month: @exp_month,
                                 exp_year: @exp_year,
                                 cvc: @cvc })
  end
end
