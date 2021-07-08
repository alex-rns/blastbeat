# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    sequence(:title) { |n| "Title #{n}" }
    brand { 'test-brand' }
    price { 123 }
    manufacturer { 'Ukraine' }
    category { 'bahbah' }
  end
end
