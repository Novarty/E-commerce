require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  protect_from_forgery with: :exception
  helper_method :anyone_signed_in?

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  AVAILABLE_LOCALES = %w(en ru).freeze

  def anyone_signed_in?
    manager_signed_in? || user_signed_in?
  end

  def set_locale
    I18n.locale = if manager_signed_in?
      current_manager.locale
    elsif user_signed_in?
      current_user.locale
    elsif params[:locale].present? && (params[:locale].in? AVAILABLE_LOCALES)
      params[:locale]
    else
      browser_locale = extract_language_from_request
      browser_locale.in?(AVAILABLE_LOCALES) ? browser_locale : I18n.default_locale
    end
  end

  protected

  def extract_language_from_request
    language_data = request.env["HTTP_ACCEPT_LANGUAGE"]
    language_data.present? ? language_data.scan(/^[a-z]{2}/).first : "en"
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :locale])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :locale])
  end
end
