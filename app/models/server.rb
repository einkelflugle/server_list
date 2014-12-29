class Server < ActiveRecord::Base
	belongs_to :user

	validate :server_must_be_online

	def server_must_be_online
		
	end
end