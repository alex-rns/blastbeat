# frozen_string_literal: true

require 'application_responder'

# :nodoc:
class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  self.responder = ApplicationResponder
  respond_to :html
end
