class BandsController < ApplicationController
	def index
		@band = Band.all
	end

	def new
		@band = Band.new	
	end

	def create
		@band = current_user.bands.create(band_params)

		if @band.save
			redirect_to @band
		else
			render :index
		end
	end

	def show
		@band = Band.find(params[:id])
	end

	def edit 
		@band = Band.find(params[:id])
	end

	def update
		@band = Band.find(params[:id])

		if @band.update(band_params)
			redirect_to @band
		else
			render :index 
		end
	end

	def destroy 
		@band = Band.find(params[:id])

		if @band.destroy
			redirect_to root_url
		else
			redirect_to @band
		end
	end

	private
	def band_params
		params.require(:band).permit(:name, :description, :genre, :region, :since)
	end	
end