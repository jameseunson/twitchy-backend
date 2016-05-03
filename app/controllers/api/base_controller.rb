class Api::BaseController < ActionController::Base

	skip_before_filter :verify_authenticity_token
	# http_basic_authenticate_with name: "EXt86P7kUdrPZh2y89vk4yr889a77A8C", password: "rNJ46aBv7SMCdGHhQvcm6HxbmzbgtmmM"
	
	respond_to :json
end
