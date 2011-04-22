module Readability
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      desc "Creates a Readability config file for you to modify and adds necessary routes."

      def copy_config
        template "readability.yml", "config/readability.yml"
      end

      def copy_routes
        route "match 'readability/callback', to: 'controller#action', as: 'readability_callback'"
        route "match 'readability/logout', to: 'controller#action', as: 'readability_logout'"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end

    end
  end
end
