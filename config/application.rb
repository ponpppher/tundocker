# frozen_string_literal: true

require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module Tundocker
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # set application timezone
    config.time_zone = 'Tokyo'

    # set active_record timezone
    config.active_record.default_timezone = :local

    # carrierwave path
    config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]

    # set default locale
    config.i18n.default_locale = :ja

    # fix: field_for_errors layout
    config.action_view.field_error_proc = proc.new { |html_tag, _| html_tag }

    # suppress generate test files
    config.generators do |g|
      g.test_framework false
    end
  end
end
