class Code < ActiveRecord::Base

	before_create :generate_code

	protected

	def generate_code
		self.code = loop do
			random_code = SecureRandom.hex(4)
			break random_code unless Code.where(code: random_code).exists?
		end
	end
end
