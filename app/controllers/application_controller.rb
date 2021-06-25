# frozen_string_literal: true

require 'application_responder'

# :nodoc:
class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
end
