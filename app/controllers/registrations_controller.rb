class RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate
  before_action :configure_permitted_parameters
  layout 'welcome'

  def create
    super
    session[:omniauth] = nil unless @user.new_record?
  end

  private
  def build_resource(*args)
    super
    if session[:omniauth]
      @user.apply_omniauth(session[:omniauth])
      @user.valid?
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
