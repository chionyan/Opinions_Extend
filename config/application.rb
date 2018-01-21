require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Opinions
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    #config.i18n.default_locale = :ja
    
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,         # モデル作成時にフィクスチャの作成を有効化(後述のfactory_girlが適用される)
        view_specs: false,      # 以下、必要に応じて任意にトグルする
        helper_specs: false,
        routing_specs: false,
        controller_specs: true,
        request_specs: true
    
      # fixtureの代わりにfactory_botを使うよう設定
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
    end

  end
end

#config.time_zone = 'Tokyo'