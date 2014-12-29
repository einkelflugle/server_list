class AddFieldsToServers < ActiveRecord::Migration
  def change
    add_column :servers, :description, :text
    add_column :servers, :address, :string
    add_column :servers, :private, :boolean
  end
end
