class UnturnedServer < ActiveRecord::Base
	belongs_to :user

	before_save :unload_data

	validate :server_must_be_online

	private

		def unload_data
			server_data = ServerHandler.get_data(address)

			self.map_name = server_data[:map_name]
			self.num_players = server_data[:number_of_players]
			self.max_players = server_data[:max_players]
			self.dedicated = (server_data[:dedicated] == "d")
			self.operating_system = server_data[:operating_system]
			self.password_protected = server_data[:password_needed]
			self.secure = server_data[:secure]
			self.game_version = server_data[:game_version]
		end

		def server_must_be_online
			if !ServerHandler.online?(address)
				errors.add(:unturned_server, "not online.")
			end
		end
end