require_relative 'boot'

require 'rails/all'
require 'carrierwave'
require 'carrierwave/orm/activerecord'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Siforlat
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.time_zone = 'Jakarta'
    config.assets.paths << "#{Rails.root}/vendor/assets/fonts}"
    # config.assets.paths << "#{Rails.root}/app/assets/fonts}"
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
