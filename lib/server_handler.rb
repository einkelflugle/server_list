module ServerHandler
	require 'ipaddr'
	require 'steam-condenser'

	def self.online?(server)
		connect(server.address) ? true : false
	end

	def self.get_data(server)
		if server = connect(server.address)
			server.server_info
		end
	end

	def self.update_server_stats(unturned_server, options = {})
		server_data = get_data(unturned_server)

		unturned_server.map_name = server_data[:map_name]
		unturned_server.num_players = server_data[:number_of_players]
		unturned_server.max_players = server_data[:max_players]
		unturned_server.dedicated = (server_data[:dedicated] == "d")
		unturned_server.operating_system = server_data[:operating_system]
		unturned_server.password_protected = server_data[:password_needed]
		unturned_server.secure = server_data[:secure]
		unturned_server.game_version = server_data[:game_version]

		unturned_server.save if options[:save]
	end

	private

		def self.connect(address)
			begin
				server = SourceServer.new(address, 27016)
				server.init
				return server
			rescue SocketError
				return false
			rescue SteamCondenser::TimeoutError
				return false
			rescue Errno::ECONNREFUSED
				return false
			end
		end
end