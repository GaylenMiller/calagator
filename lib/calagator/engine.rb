module Calagator
  class Engine < ::Rails::Engine
    isolate_namespace Calagator

    config.before_initialize do
      # Read secrets
      require 'secrets_reader'
      ::SECRETS = SecretsReader.read
    end
  end

  # settings with defaults
  class << self
    mattr_accessor :title, :tagline, :url, :venues_map_options

    title = 'Calagator'
    tagline = 'A Tech Calendar'
    url = 'http://calagator.org/'
    venues_map_options = {}

    # map the attrs from initializer
    def setup(&block)
      yield self
    end
  end
end
