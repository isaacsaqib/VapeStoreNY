class ListingsController < ApplicationController
	def index
		@listings = Listing.all
		@listings_ejuice = Listing.where(:section => "E-Juice")
		@listings_device = Listing.where(:section => "Devices")
	end

	def new
		@listing = Listing.new
	end

	def create
		@listings = Listing.create(listing_params)
			if @listings.save
				redirect_to "/"
			else
				render :new

			end
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def edit
		@listing = Listing.find(params[:id])

	end

		 def update
    @listing = Listing.find(params[:id])

    respond_to do |format|
      if @listing.update_attributes(listing_params)
        if params[:images]
          # The magic is here ;)
          params[:images].each { |image|
            @listing.pictures.create(image: image)
          }
        end
        format.html { redirect_to @listing, notice: 'listing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

	def destroy
		@listing = Listing.find(params[:id])
		@listing.destroy
		if @listing.destroy
			redirect_to @listing 
		else
			render :edit
		end
	end

	private

	def listing_params
		params.require(:listing).permit(
		:name,
		:size,
		:description,
		:price,
		:features,
		:product_includes,
		:product_recommendations,
		:nicotine_level,
		:dimensions,
		:warning_section,
		:youtube_video_link,
		:gauges,
		:ohm_level,
		:coil_specs,
		:note,
		:safety_notes,
		:section)
	end


	

end
