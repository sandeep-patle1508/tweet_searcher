# Retry passed block of code on error

class Retryable
	MAX_RETRY = 5.freeze

	def self.run(action_name = 'Execution')
		retries = 0

		begin
			yield
    rescue Exception => e
    	puts retries
    	puts @max_retries
    	if (retries += 1) <= MAX_RETRY
  			sleep(retries)
  			retry
		  else
		    raise "#{action_name} failed #{e.inspect}"
		  end
    end
	end
end