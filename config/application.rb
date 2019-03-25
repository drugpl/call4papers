require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cfp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.conference = OpenStruct.new({
      starts: Time.parse("2020-03-20"),
      ends: Time.parse("2020-03-22"),
      cfp_starts: Time.parse("2019-03-25"),
      cfp_ends: Time.parse("2020-01-31")
    })

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
