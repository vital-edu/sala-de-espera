require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module SalaDeEspera
  class Application < Rails::Application
    config.time_zone = 'Brasilia'
    config.i18n.available_locales = [:en, :"pt-BR"]
    config.i18n.default_locale = :"pt-BR"
  end
end
