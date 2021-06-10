# frozen_string_literal: true

class Product < ApplicationRecord
  validates :title, :price, :category, :brand, :manufacturer, presence: true
  validates :title, :category, :brand, length: { in: 2..20 }
  validates :price, numericality: { only_integer: true }
  validates :title, uniqueness: true

  def pass_title
    title
  end
end
