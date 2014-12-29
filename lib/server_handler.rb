module ServerHandler
	require 'ipaddr'
	require 'steam-condenser'

	def self.online?(address)
		begin
			server = SourceServer.new(address, 27016)
			server.init
			return true
		rescue SocketError
			return false
		rescue SteamCondenser::TimeoutError
			return false
		rescue Errno::ECONNREFUSED
			return false
		end
	end

	def self.get_data(address)
		begin
			server = SourceServer.new(address, 27016)
			server.init
			server.server_info
		rescue SocketError
			return false
		rescue SteamCondenser::TimeoutError
			return false
		rescue Errno::ECONNREFUSED
			return false
		end
	end

	def self.update_server_stats
		begin
			UnturnedServer.all.each do |unturned_server|
				server = SourceServer.new(unturned_server.address, 27016)
				server.init
				server.server_info
			end
		rescue SocketError
			return false
		rescue SteamCondenser::TimeoutError
			return false
		rescue Errno::ECONNREFUSED
			return false
		end
	end
end