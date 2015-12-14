class ListingsController < ApplicationController
	def index
		@listings = Listing.all
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
		@listing.update


	end

	def destroy
		@listing = Listing.find(params[:id])
		@listing.destroy		
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
