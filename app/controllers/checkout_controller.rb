class CheckoutController < ApplicationController
	
	def index
    		@cart = session[:cart]
    end
end
