class ListingsController < ApplicationController
	def index
		@listings = Listing.all
		@listings_ejuice = Listing.where(:section => "E-Juice")
		@listings_device = Listing.where(:section => "Devices")
		@listings_tank = Listing.where(:section => "Tanks")
		@listings_rda = Listing.where(:section => "Rebulidables/RDA's")
		@listings_drip_kit = Listing.where(:section => "Drip Kits")
		@listings_wire = Listing.where(:section => "Wire")
		@listings_wick = Listing.where(:section => "Wicks")
		@listings_replacement_part = Listing.where(:section => "Replacement Parts")
		@listings_replacement_coil = Listing.where(:section => "Replacement Coils")
		@listings_batteries = Listing.where(:section => "Batteries")
		@listings_charger = Listing.where(:section => "Chargers")
		@listings_essential_rda = Listing.where(:section => "Essential Tools for Rebulidables")
		@listings_cases_and_mod_pouches = Listing.where(:section => "Cases and Mod Pouches")
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
		if params[:id]
			session[:carts] ||= {}
		@listing = Listing.find(params[:id])
		@count_cart = session[:carts].count + 2
			session[:carts][@count_cart] = [@listing.name,@listing.price,params[:product_id],@count_cart]
		
		end	

		if params[:remove]
			Listing.delete(params[:remove])
		end

	  # Amount in cents
	  	
	  	@amount = @listing.price

	  	@listing  = Listing.find(params[:id])

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
