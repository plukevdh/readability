module Readability
  module Helpers
    module Authentication
      def readabilified?
        !!readability_access
      end

      def readability_access
        session[:readability_access]
      end

      def readability(resource, args = {})
        readability_client.get(resource, args)
      end

      def readability_client
        @client ||= Readability::Client.new(readability_access)
      end
    end
  end
end
