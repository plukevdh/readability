module Readability
  require 'engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
  SITE = "https://www.readability.com"

  require 'readability/client'
  require 'readability/acts_as_readability'
  require 'readability/helpers/authentication'

end