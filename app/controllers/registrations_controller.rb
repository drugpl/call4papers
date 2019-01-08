class RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate
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
end
