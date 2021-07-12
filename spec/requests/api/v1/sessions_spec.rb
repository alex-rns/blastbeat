# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/v1/sessions', type: :request do
  path '/api/v1/users/sign_in' do
    post 'Login of the user' do
      tags 'Authorization'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: ['email', 'password']
      }

      response(201, 'successful') do
        run_test!
      end
    end
  end
end
