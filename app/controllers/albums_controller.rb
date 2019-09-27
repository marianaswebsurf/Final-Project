class AlbumsController < ApplicationController
	def index
		@album = Album.all
	end

	def new
		@album = Album.new
	end

	def create 
		@album = current_user.bands.first.albums.create(album_params)

		if @album.save 
			redirect_to @album
		else
			render_to :new
		end
	end

	def show 
	 	@album = Album.find(params[:id])	
	end 

	def destroy
		@album = Album.find(params[:id])		
	
		if @album.destroy
			redirect_to root_url
		else
			redirect_to @album
		end	
	end	

   private
    def album_params
    	params.require(:album).permit(:name, images: [])
    end
end
