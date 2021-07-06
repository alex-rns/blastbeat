# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/v1/products_controller', type: :request do
  path '/api/v1/products' do
    get 'List products' do
      tags 'Products'
      consumes 'application/json'
      parameter name: :min_price, in: :query
      parameter name: :max_price, in: :query
      parameter name: :brand, in: :query
      parameter name: :category, in: :query
      parameter name: :manufacturer, in: :query

      response(200, 'successful') do
        run_test!
      end
    end

    post 'Create product' do
      tags 'Products'
      consumes 'application/json'
      parameter name: :product, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string }
        },
        required: %i[title]
      }

      response(201, 'successful') do
        run_test!
      end
    end
  end

  path '/api/v1/products/{id}' do
    get 'Show product' do
      tags 'Products'
      consumes 'application/json'
      parameter name: :id,
                in: :path,
                type: :integer,
                description: 'Product id'

      response(200, 'successful') do
        run_test!
      end
    end

    put 'Update product' do
      tags 'Products'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer
      parameter name: :product, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          description: { type: :string },
          price: { type: :integer },
          category: { type: :string },
          brand: { type: :string },
          manufacturer: { type: :string },
          year: { type: :integer }
        },
        required: %i[title description price category brand manufacturer year]
      }

      response(200, 'successful') do
        run_test!
      end
    end

    delete 'Delete product' do
      tags 'Products'
      consumes 'application/json'
      parameter name: :id,
                in: :path,
                type: :integer,
                description: 'Product id'

      response(200, 'successful') do
        run_test!
      end
    end
  end
end
