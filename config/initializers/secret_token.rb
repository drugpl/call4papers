if Rails.env.development?
  Cfp::Application.config.secret_token = "0df6016f9cee2dc2295dd66ef005452f01fb932b8059c3abf3b7adfbf0d11b7b"
else
  Cfp::Application.config.secret_token = ENV['SECRET_TOKEN']
end
