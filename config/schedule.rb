set :output, '/Users/einkelflugle/error.log'

every 1.minutes do
	runner "UnturnedServer.update_all_stats"
end
