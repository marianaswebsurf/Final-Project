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

	def edit
		@album = Album.find(params[:id])
	end

	def add
		@album = Album.find(params[:id])

		if @album.update(album_params)

			redirect_to @album
		else
			render :add
		end
	end

	def update
		@album = Album.find(params[:id])

		if @album.update(album_params)

			redirect_to @album
		else
			render :edit
		end
	end

	def delete_image_attachment
	  @image = ActiveStorage::Blob.find_signed(params[:id])
      @image.attachments.first.purge
      redirect_back(fallback_location: album_path)
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
