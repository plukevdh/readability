module Readability
  module ActsAsReadability
    module Base
      def self.included(klass)
        klass.class_eval do
          extend Config
        end
      end

      module Config
        def acts_as_readability
          include Readability::Helpers::Authentication
          helper Readability::Helpers::Authentication
        end
      end
    end
  end
end

::ActiveRecord::Base.send :include, Readability::ActsAsReadability::Base

