require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception

  helper_method :anyone_signed_in?

  def anyone_signed_in?
    manager_signed_in? || user_signed_in?
  end
end
