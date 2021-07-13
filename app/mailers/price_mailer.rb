# frozen_string_literal: true

# :nodoc:
class PriceMailer < ApplicationMailer
  def new_price_email(product)
    @product = product
    @users = User.all
    emails = @users.collect(&:email).join(', ')
    mail(to: emails, subject: 'You got a new order!')
  end
end
