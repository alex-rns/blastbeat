# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/v1/comments_controller' do
  path '/api/v1/comments' do
    get 'List comments' do
      tags 'Comments'
      consumes 'application/json'
      security [
        { ApiKeyAuth: [] }
      ]
      response(200, 'successful') do
        run_test!
      end
    end
  end
end
