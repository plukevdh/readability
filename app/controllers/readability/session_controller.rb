class Readability::SessionController < ApplicationController
  before_filter :parse_options, only: [:show]
  unloadable

  def show
    flash[:alert] = "Could not authenticate with Readability" unless access_token
    redirect_to "/readability/callback"
  end

  def new
    request_token = consumer.get_request_token(:oauth_callback => callback_url)
    session[:request_token] = request_token
    redirect_to request_token.authorize_url(:oauth_callback => callback_url)
  end

  private 
  def access_token
    verifier = params[:oauth_verifier]
    
    return nil unless session[:request_token] && verifier
    access_token = session[:request_token].get_access_token(:oauth_verifier => verifier)
    
    session[:readability_access] = access_token
    session[:request_token] = nil

    access_token
  end

  def parse_options
    @options = "?"
    @options += "archive=#{params[:archive] ? 1 : 0}"
    @options += "&favorite=#{params[:favorite] ? 1 : 0}"
  end

  def callback_url
    uri = URI.parse(request.url)
    uri.path = readability_session_path
    uri.query = nil
    uri.to_s
  end

  def consumer_keys
    @consumer_keys ||= YAML.load_file( File.join(Rails.root, 'config', 'readability.yml') )
  end

  def consumer
    @consumer ||= OAuth::Consumer.new(consumer_keys['consumer_key'], consumer_keys['consumer_secret'], {
                         site: "https://www.readability.com",
                         authorize_path: "/api/rest/v1//oauth/authorize/",
                         access_token_path: "/api/rest/v1/oauth/access_token/",
                         request_token_path: "/api/rest/v1/oauth/request_token/"})
  end

end

