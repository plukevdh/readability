# This is the base query class. It handles making requests to the API and returning the data as a hash.
module Readability
  class Client
    attr_accessor :resources

    BASE_API = "/api/rest/v1"

    def initialize(token)
      @token = token.dup

      # get available resource types
      @resources = request
    end

    def request(resource="", args={}, body={})
      if body == {}
        response = @token.get(format_query(resource, args))
      else
        response = @token.post(format_query(resource, args), parameterize(body),
                               { 'Content-Type' => 'application/x-www-form-urlencoded' })
      end
      case response
        when Net::HTTPSuccess
          data = JSON.parse(response.body)
          data = data[resource.to_s] unless resource.blank? || args.include?(:id)
          data
      else
        raise StandardError, "Could not get data for those params."
      end
    end
    alias :get :request

    def format_query(resource, args)
      options = args.dup
      query = "#{BASE_API}/#{resource}"
      query << "/#{options.delete :id}" if options.include? :id
      query << "?#{parameterize(options)}" unless options.empty?
      query
    end
    alias :to_url :format_query

    def parameterize(params)
      URI.escape(params.collect{|k,v| "#{k}=#{v}"}.join('&'))
    end
  end
end
