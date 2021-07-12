# frozen_string_literal: true

module Api
  module V1
    # :nodoc:
    class CommentsController < ApplicationController
      def index
        @comments = Comment.all
        render json: @comments, message: 'Comment list', status: :ok
      end
    end
  end
end
