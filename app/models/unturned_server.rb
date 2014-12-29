class UnturnedServer < ActiveRecord::Base
	belongs_to :user

	before_save :fetch_remaining_data

	validate :server_must_be_online

	def self.update_all_stats
		UnturnedServer.all.each do |unturned_server|
			ServerHandler.update_server_stats(unturned_server, save: true)
		end
	end

	private

		def fetch_remaining_data
			ServerHandler.update_server_stats(self, save: false)
		end

		def server_must_be_online
			if !ServerHandler.online?(self)
				errors.add(:unturned_server, "not online.")
			end
		end
end