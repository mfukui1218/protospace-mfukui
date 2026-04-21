class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :profile, :affiliation, :position])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :profile, :affiliation, :position])
  end
end
