require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Getfile
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.i18n.default_locale = :ru
    config.time_zone = 'Europe/Kiev'


    # добавляю папку public/uploads в файлопровод
    config.assets.paths << Rails.root.join("public", "uploads")
    # прекомпиляция ассетов для картинок
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif *.bmp)
    config.assets.precompile += %w(*.mp3 *.wav)
    config.assets.precompile += %w(*.avi *.mkv *.mov *.mp4 *.mpeg *.webm *.ogv)
    # config.assets.precompile = true

  end
end
