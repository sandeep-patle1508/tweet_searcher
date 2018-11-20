class	Tweet
	attr_reader :tweet_id, :text, :user_screen_name, :created_at

	def initialize(tweet_id, text, user_screen_name, created_at)
		@tweet_id = tweet_id
		@text = text
		@user_screen_name = user_screen_name
		@created_at = created_at
	end
end