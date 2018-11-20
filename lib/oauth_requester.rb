# Using the OAuth Ruby Gem to connect with twiiter
# https://developer.twitter.com/en/docs/basics/authentication/guides/single-user.html

#=======================================================================================================================
require 'oauth'
require 'json'

class OauthRequester

  def initialize(url, consumer_key, secret_consumer_key, oauth_token, secret_oauth_token)
    @url = url
    @consumer_key = consumer_key
    @secret_consumer_key = secret_consumer_key
    @oauth_token = oauth_token
    @secret_oauth_token = secret_oauth_token
  end

  # to call Twitter get API like search
  def GET(request_url)
    response = nil
    access_token = prepare_access_token

    Retryable.run('OAuth Request') do
      response = access_token.request(:get, "#{@url}#{request_url}")
      puts response.inspect
    end

    parse_response(response) if response && response.code == '200'
  end

  private
  # get access token to communicate with Twitter API's
  def prepare_access_token

    Retryable.run('OAuth Consumer') do
      consumer = OAuth::Consumer.new(@consumer_key, @secret_consumer_key, 
        { :site => "#{@url}", :scheme => :header })

      # now create the access token object from passed values
      token_hash = { :oauth_token => @oauth_token, :oauth_token_secret => @secret_oauth_token }

      OAuth::AccessToken.from_hash(consumer, token_hash)
    end
  end

  # convert API reponse body into JSON
  def parse_response(response)
    JSON.parse(response.body) 
  end   
end