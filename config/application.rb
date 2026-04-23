require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ProtospaceMfukui
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # ==========================================
    # ✅ Render Free + Docker 対策（最重要）
    # Rails起動の最初に secret_key_base を必ず用意する
    # ==========================================
    if ENV["SECRET_KEY_BASE"].blank?
      ENV["SECRET_KEY_BASE"] = "dummy_secret_key_base_for_render"
    end

    # ------------------------------------------
    # Application configuration
    # ------------------------------------------

    # Time zone
    config.time_zone = "Tokyo"
    config.active_record.default_timezone = :local

    # Autoload paths
    config.autoload_lib(ignore: %w[assets tasks])

    # Generators configuration
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot, dir: "spec/factories"
      g.assets false
      g.helper false
    end
  end
end