# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    body { 'MyString' }
    product_id { create[:product].id }
  end
end
