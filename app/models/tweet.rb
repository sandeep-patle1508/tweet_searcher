class	Tweet
	attr_reader :tweet_id, :text, :in_reply_to_screen_name, :created_at

	def initialize(tweet_id, text, in_reply_to_screen_name, created_at)
		@tweet_id = tweet_id
		@text = text
		@in_reply_to_screen_name = in_reply_to_screen_name
		@created_at = created_at
	end


end