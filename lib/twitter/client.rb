# Standard search GET API
# Returns a collection of relevant Tweets matching a specified query.
# https://developer.twitter.com/en/docs/tweets/search/api-reference/get-search-tweets.html

module Twitter
  class Client
    TWITTER_URL = 'https://api.twitter.com'.freeze
    SEARCH_URI = '/1.1/search/tweets.json'

    DEFAULT_SEARCH_OPTIONS = {
      count: 50, # number of tweets to return per page
      result_type: 'popular' # specifies what type of search results
    }

    def initialize
      @oauth_requester = OauthRequester.new(TWITTER_URL,
        Rails.application.credentials.twitter[:consumer_key],
        Rails.application.credentials.twitter[:secret_consumer_key],
        Rails.application.credentials.twitter[:oauth_token],
        Rails.application.credentials.twitter[:secret_oauth_token]
      )
      @collection = []
    end

    # return array of tweet object if response is successful
    def search(options)
      options = DEFAULT_SEARCH_OPTIONS.merge(options)

      response = @oauth_requester.GET("#{SEARCH_URI}?#{options.to_query}")

      if response
        response.fetch('statuses', []).collect do |tweet|
          @collection << Tweet.new(tweet['id'], tweet['text'], tweet['in_reply_to_screen_name'], tweet['created_at'])
        end
      end
      
      return @collection
    end

  end
end