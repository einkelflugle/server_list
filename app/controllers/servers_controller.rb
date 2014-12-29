class ServersController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :get_server, only: [:show, :edit, :update, :destroy]

	def index
		@servers = Server.all
	end

	def new
		@server = current_user.servers.new
	end

	def create
		@server = current_user.servers.create(server_params)

		if @server.save
			redirect_to @server, notice: "Successfully created server."
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		@server.update(server_params)

		if @server.save
			redirect_to @server, notice: "Successfully updated server."
		else
			render 'edit'
		end
	end

	def destroy
		@server.destroy

		redirect_to root_path, notice: "Successfully deleted server."
	end

	private

		def server_params
			params.require(:server).permit(:name, :address, :description, :private)
		end

		def get_server
			@server = Server.find(params[:id])
		end
end