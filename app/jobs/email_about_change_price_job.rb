# frozen_string_literal: true

# :nodoc:
class EmailAboutChangePriceJob < ApplicationJob
  queue_as :default

  def perform(product)
    PriceMailer.new_price_email(product).deliver_now
  end
end
