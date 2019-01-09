class PasswordsController < Devise::PasswordsController
  skip_before_action :authenticate
  layout 'welcome'
end
