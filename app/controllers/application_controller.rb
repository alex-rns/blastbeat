# frozen_string_literal: true

require 'application_responder'

# :nodoc:
class ApplicationController < ActionController::Base
  before_action :set_user
  before_action :authenticate_user!
  self.responder = ApplicationResponder

  respond_to :html, :json

  protect_from_forgery with: :null_session

  def set_user
    if request.headers['Authorization'].present?
      token = request.headers['Authorization'].split(' ')[1]
      @user = User.find_by(authentication_token: token)
    end
  end

  def redirect_if_no_admin
    redirect_to home_path unless current_user.admin?
  end
end
