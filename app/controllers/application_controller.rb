class ApplicationController < ActionController::Base

  before_action :set_locale
  
  before_action :masquerade_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  def current_team
    current_user.teams.friendly.find(params[:team_id] || current_user.team_id)
  end
  helper_method :current_team
  
  private

  def set_locale(option = {})
    I18n.locale = params[:locale] ||
      browser_locale ||
      I18n.default_locale
  end

  def browser_locale
    http_language = request.env['HTTP_ACCEPT_LANGUAGE']

    return 'en' if !http_language

    language = http_language.scan(/^[a-z]{2}/).first.presence || 'en'

    if I18n.available_locales.include?(language.to_sym)
      language
    else
      'en'
    end
  end
  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
