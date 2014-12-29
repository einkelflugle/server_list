class AddMapNameToUnturnedServers < ActiveRecord::Migration
  def change
    add_column :unturned_servers, :map_name, :string
  end
end
