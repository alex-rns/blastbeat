# frozen_string_literal: true

require 'application_responder'

# :nodoc:
class ApplicationController < ActionController::Base
  acts_as_token_authentication_handler_for User, fallback: :none
  before_action :set_user
  before_action :authenticate_user!
  self.responder = ApplicationResponder

  respond_to :json, :html

  protect_from_forgery with: :null_session

  def set_user
    if request.headers['Authorization'].present?
      token = request.headers['Authorization'].split(' ')[1]
      @user = User.find_by(authentication_token: token)
    end
  end

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
