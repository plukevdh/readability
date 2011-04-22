module Readability
  module Helpers
    module Authentication
      def readabilified?
        !!readability_access
      end

      def readability_access
        session[:readability][:readability_access] if session[:readability]
      end

      def readability(resource, args = {})
        readability_client.get(resource, args)
      end

      def dereadabilify
        session[:readability] = nil
      end

      def readability_client
        @client ||= Readability::Client.new(readability_access)
      end
    end
  end
end
