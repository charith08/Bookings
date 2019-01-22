require_relative 'boot'

require 'rails/all'
#require 'postmark'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module Rubyapp5
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    #config.assets.initialize_on_precompile = false
    config.load_defaults 5.2
    config.action_mailer.delivery_method = :postmark
    config.action_mailer.postmark_settings = { :api_token => "b76f5692-4a8d-4575-b28a-549a8e3f1a3c" }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
