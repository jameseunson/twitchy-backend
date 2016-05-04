class IndexController < ApplicationController

	def index
	end

	def code
	end

	def code_error
	end

	def code_token
	end	

	def code_token_save

		# Example hash
		# #access_token=mkb6g9322wzzkl616btn631cezhbrq&scope=user_read+user_subscriptions+user_follows_edit+chat_login&state=ec4511926d183022e43bd5042dbdf06a

		if !params.has_key?(:hash)
			redirect_to code_token_error_path			
			return
		end

		# remove first char
		hash = params[:hash].slice(1, params[:hash].length - 1) 
		hash_components = hash.split("&") # Should be 3 components at this point, access_token, scope and state

		hash_lookup = {}

		hash_components.each do |hc|
			hcc = hc.split("=") # Splits into key/val
			hash_lookup[hcc[0].to_sym] = hcc[1]
		end

		# We can identify the transaction using the state/nonce value we passed originally
		# Otherwise we're going to have to store the code in a session value
		# because it can't be passed through the Twitch.tv API otherwse. If we can avoid
		# managing a session variable, then great
		state = hash_lookup[:state]

		@code = Code.where(:state => hash_lookup[:state]).first
		if @code == nil
			redirect_to code_token_error_path
			return
		end

		@code.user_token = hash_lookup[:access_token]
		if @code.save
			redirect_to code_token_done_path			
		else
			redirect_to code_token_error_path			
		end	
	end

	def code_token_done

	end

	def process_code

		code = params[:code].downcase.gsub(/\s+/, "")

		@code = Code.where(:code => code).first
		if @code == nil
			redirect_to code_error_path
			return
		end

		request_url = "https://api.twitch.tv/kraken/oauth2/authorize?response_type=token" +
			"&client_id=#{Rails.application.secrets.twitch_client_id}" +
			"&redirect_uri=http://localhost:3000/code/token"+
		    "&scope=user_read+user_subscriptions+user_follows_edit+chat_login"+
		    "&state=#{@code.state}"

		redirect_to request_url
		return
	end
end
