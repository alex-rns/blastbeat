# frozen_string_literal: true

module Api
  module V1
    module Users
      # :nodoc:
      class SessionsController < Devise::SessionsController
        skip_before_action :authenticate_user!, only: %i[create]
        skip_before_action :require_no_authentication, only: %i[create]
        skip_before_action :set_user, only: %i[create]

        def create
          @user = User.find_by(email: params[:email])
          if @user&.valid_password?(params[:password])
            render json: @user
          else
            render json: { errors: { user: check_error_type } },
                   status: :unprocessable_entity
          end
        end

        private

        def user_params
          params.permit(:email, :password)
        end

        def check_error_type
          error = t('activerecord.errors.sessions.incorrect_data')
          error = t('activerecord.errors.sessions.incorrect_email') if params[:email].nil?
          error = t('activerecord.errors.sessions.incorrect_password') if params[:password].nil?
          error
        end
      end
    end
  end
end
