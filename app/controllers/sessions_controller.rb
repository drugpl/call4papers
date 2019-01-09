class SessionsController < Devise::SessionsController
  skip_before_action :authenticate
  layout 'welcome'
end
