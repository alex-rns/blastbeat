# frozen_string_literal: true

require 'application_responder'

# :nodoc:
class ApplicationController < ActionController::Base
  before_action :set_user
  before_action :authenticate_user!
  self.responder = ApplicationResponder

  protect_from_forgery with: :null_session

  def set_user
    if request.headers['Authorization'].present?
      token = request.headers['Authorization'].split(' ')[1]
      @user = User.find_by(authentication_token: token)
    end
  end
end
