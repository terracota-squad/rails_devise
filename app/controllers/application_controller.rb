class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    requested_locale = params[:locale]&.downcase

    if requested_locale.present? && locale_valid?(requested_locale)
      matched_locale = I18n.available_locales.find { |l| l.to_s.downcase == requested_locale }
      cookies[:locale] = matched_locale.to_s
    end

    I18n.locale = extract_locale
  end

  private

  def extract_locale
    current_cookie = cookies[:locale]&.downcase

    if current_cookie.present? && locale_valid?(current_cookie)
      I18n.available_locales.find { |l| l.to_s.downcase == current_cookie }
    else
      I18n.default_locale
    end
  end

  def locale_valid?(locale)
    supported_locales = I18n.available_locales.map { |l| l.to_s.downcase }
    supported_locales.include?(locale.to_s.downcase)
  end
end