class Api::CodeController < Api::BaseController

	def create
		@code = Code.new
		@code.save
	end

	def status

		@success = false		
		if !params.has_key?(:id) || !params.has_key?(:hash)
			return
		end

		hash = Digest::SHA1.hexdigest "#{params[:id]}#{Rails.application.secrets.twitch_client_secret}"
		puts hash

		if hash != params[:hash]
			return
		end

		@code = Code.where(:code => params[:id]).first
		if @code == nil
			return
		end

		@success = true
	end
end
