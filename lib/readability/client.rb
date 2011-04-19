# This is the base query class. It handles making requests to the API and returning the data as a hash.
module Readability
  class Client
    attr_accessor :resources

    BASE_API = "/api/rest/v1"

    def initialize(token)
      @token = token.dup

      # get available resource types
      @resources = get
    end

    def get(resource="", args={})
      response = @token.get(format_query(resource, args))
      case response
        when Net::HTTPSuccess
          data = JSON.parse(response.body)
          data = data[resource.to_s] unless resource.blank?
          data
      else
        raise StandardError, "Could not get data."
      end
    end

    def format_query(resource, args)
      query = "#{BASE_API}/#{resource}"
      query << "?#{parameterize(args)}" unless args.empty?
      query
    end

    def parameterize(params)
      URI.escape(params.collect{|k,v| "#{k}=#{v}"}.join('&'))
    end
  end
end