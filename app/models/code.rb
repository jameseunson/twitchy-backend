class Code < ActiveRecord::Base

	before_create :generate_code, :generate_state

	protected

	def generate_code
		self.code = loop do
			random_code = SecureRandom.hex(4)
			break random_code unless Code.where(code: random_code).exists?
		end
	end

	def generate_state
		self.state = loop do
			state_code = SecureRandom.hex(16)
			break state_code unless Code.where(state: state_code).exists?
		end
	end	
end
