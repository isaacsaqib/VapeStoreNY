class ListingsController < ApplicationController
		skip_before_filter  :verify_authenticity_token

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
		@listing = Listing.new(listing_params)

		respond_to do |format|
			if @listing.save
				if params[:images]
					params[:images].each {|image|
						@listing.pictures.create(image: image)
					}

				end

			format.html { redirect_to @listing, notice: 'listing was successfully created.' }
	      	format.json { render json: @listing, status: :created, location: @listing }
	    	else
	      	format.html { render action: "new" }
	      	format.json { render json: @listing.errors, status: :unprocessable_entity }
	    	end
  		end
	end

	

	def show
		if params[:id]
			session[:cart] ||= {}
		@listing = Listing.find(params[:id])
		@count_cart = session[:cart].count + 2
			# session[:cart][@count_cart] = [@listing.name, @listing.price, params[:product_id], params[:size], @count_cart, @listing.pictures.first.image.url]


		
		end	


	  # Amount in cents
	  	
	  	@amount = @listing.price

	  	@listing  = Listing.find(params[:id])
    	@pictures = @listing.pictures

 
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

	end

	def add_to_cart
		session[:cart] ||= {}
		key = [params[:id], params[:size]].join('-')
		session[:cart][key] = (session[:cart][key] || 0) + 1
		redirect_to :cart
	end

	def remove_from_cart
		session[:cart].delete(params[:id])
		redirect_to :cart
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
