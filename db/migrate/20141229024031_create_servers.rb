class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name
      t.integer :num_players
      t.integer :max_players
      t.boolean :dedicated
      t.string :operating_system
      t.boolean :password_protected
      t.boolean :secure
      t.string :game_version
      t.integer :port
    end
  end
end
