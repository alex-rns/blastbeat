# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  let!(:product) { create(:product) }

  describe '#pass_title' do
    it 'return title' do
      expect(product.pass_title).to eql(product.title)
    end
  end

  describe '#title_length' do
    it 'return title length' do
      expect(product.title_length).to eql(product.title.length)
    end
  end
end
