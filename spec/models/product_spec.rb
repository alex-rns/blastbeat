# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:all) do
    @product = Product.create(title: 'test-title',
                              brand: 'test-brand',
                              price: 123,
                              manufacturer: 'Ukraine',
                              category: 'bahbah')
  end

  describe '#pass_title' do
    it 'return title' do
      expect(@product.pass_title).to eql(@product.title)
    end
  end

  describe '#title_length' do
    it 'return title length' do
      expect(@product.title_length).to eql(10)
    end
  end
end
