class WelcomeController < ApplicationController
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
end
