# Be sure to restart your server when you modify this file.

# ApplicationController.renderer.defaults.merge!(
#   http_host: 'example.org',
#   https: false
# )
if defined? Faker
  require 'i18n'
  I18n.locale = :ja
  require 'faker'
  Faker::Config.locale = :en
end