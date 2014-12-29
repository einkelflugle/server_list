class RenameServersToUnturnedServers < ActiveRecord::Migration
  def change
  	rename_table :servers, :unturned_servers
  end
end
