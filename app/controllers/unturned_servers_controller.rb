class UnturnedServersController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :get_server, only: [:show, :edit, :update, :destroy]

	def index
		@unturned_servers = UnturnedServer.all
	end

	def new
		@unturned_server = current_user.unturned_servers.new
	end

	def create
		@unturned_server = current_user.unturned_servers.create(server_params)

		if @unturned_server.save
			redirect_to @unturned_server, notice: "Successfully created server."
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		@unturned_server.update(unturned_server_params)

		if @unturned_server.save
			redirect_to @unturned_server, notice: "Successfully updated server."
		else
			render 'edit'
		end
	end

	def destroy
		@unturned_server.destroy

		redirect_to root_path, notice: "Successfully deleted server."
	end

	private

		def server_params
			params.require(:unturned_server).permit(:name, :address, :description, :private)
		end

		def get_server
			@unturned_server = UnturnedServer.find(params[:id])
		end
end