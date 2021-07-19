# frozen_string_literal: true

module Api
  module V1
    # :nodoc:
    class CommentsController < ApplicationController
      def index
        render json: Comment.all, message: 'Comment list', status: :ok
      end
    end
  end
end
