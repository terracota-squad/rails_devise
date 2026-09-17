class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    requested_locale = params[:locale]&.downcase

    if requested_locale.present? && locale_valid?(requested_locale)
      cookies[:locale] = requested_locale
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
    available = I18n.available_locales.map { |l| l.to_s.downcase }
    available.include?(locale.to_s.downcase)
  end
end
