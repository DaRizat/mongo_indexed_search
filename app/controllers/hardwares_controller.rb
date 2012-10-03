class HardwaresController < ApplicationController
	def index
		@page = params[:page] || 1
		@hardwares = Hardware.page(@page)

		respond_to do |format|
			format.html
			format.json { render :json => @hardwares }
		end
	end

	def show
		@hardware = Hardware.find(params[:id])

		@make = @hardware.make
		@model = @hardware.model
		@serial_number = @hardware.serial_number
		@id = @hardware.id
		@hardware_status = view_context.map_hardware_status(@hardware.hardware_status)
		@purchased_on = @hardware.purchased_on
		@sold_on = @hardware.sold_on
		@installed_on = @hardware.installed_on

		respond_to do |format|
			format.html
			format.json  { render :json => @hardware }
		end
	end

	def new
		@hardware = Hardware.new

		respond_to do |format|
			format.html
			format.json  { render :json => @hardware }
		end
	end

	def edit
		@hardware = Hardware.find(params[:id])

		respond_to do |format|
			format.html
			format.json  { render :json => @hardware }
		end
	end

	def create
		@hardware = Hardware.new(params[:hardware])

		respond_to do |format|
			if @hardware.save
				format.html { redirect_to hardware_path(@hardware.id), :notice => "Hardware Created!"}
			else
				format.html { redirect_to new_hardware_path, :flash => { :error => "Hardware could not be created." }}
			end
		end
	end

	def update
		@hardware = Hardware.find(params[:id])

		respond_to do |format|
			
			update_successful = @hardware.update_attributes(params[:hardware])
			
			if(update_successful)
				format.html { redirect_to hardware_path, :notice => "Hardware Updated!"}
			else
				format.html { redirect_to edit_hardware_path, :flash => { :error => "Could not save form." }}
			end
		end
	end

	def destroy
		@hardware = Hardware.find(params[:id])

		respond_to do |format|
			if @hardware.destroy
				format.html { redirect_to hardwares_path, :notice => "Hardware Deleted"}
			else
				format.html { redirect_to hardware_path(hardware.id), :flash => { :error => @hardware.errors }}
			end
		end
	end
end
