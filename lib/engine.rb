require 'readability'
require 'rails'

module Readability
  class Engine < Rails::Engine
    paths["app/helpers"] << 'lib/readability/helpers'
    generators do
      require "rails/generators/install_generator"
    end
  end
end