module Readability
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      desc "Creates a Readability config file for you to modify."

      def copy_config
        template "readability.yml", "config/readability.yml"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end

    end
  end
end
