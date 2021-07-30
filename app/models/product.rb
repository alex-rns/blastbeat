# frozen_string_literal: true

# :nodoc:
class Product < ApplicationRecord
  after_update :price_updated

  has_many :comments

  validates :title, :price, :category, :brand, :manufacturer, presence: true
  validates :title, :category, :brand, length: { in: 2..40 }
  validates :price, numericality: { only_integer: true }
  validates :title, uniqueness: true

  def price_updated
    EmailAboutChangePriceJob.perform_later(self) if saved_change_to_price?
  end

  # Test-only methods
  def pass_title
    title
  end

  def title_length
    title.length
  end
end
