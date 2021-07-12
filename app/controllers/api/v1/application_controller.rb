# frozen_string_literal: true

require 'application_responder'

module Api
  module V1
    # :nodoc:
    class ApplicationController < ApplicationController
      acts_as_token_authentication_handler_for User, fallback: :none

      before_action :authenticate_user!
      self.responder = ApplicationResponder

      respond_to :json, :html

      def current_user
        @current_user ||= @user
      end

      private

      def authenticate_user!
        unless current_user
          render json: { error: I18n.t('devise.failure.unauthenticated') },
                 status: :forbidden
        end
      end
    end
  end
end
