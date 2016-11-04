require_relative 'boot'
require 'rails/all'
require 'roar/representer'
require 'roar/json'

Bundler.require(*Rails.groups)
module ImageFinder
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # Configuration for grape
    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]
    # Configure slim
    Slim::Engine.set_options pretty: true, sort_attrs: false
  end
end
