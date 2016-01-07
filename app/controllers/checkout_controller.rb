class CheckoutController < ApplicationController
	
	def index
    if params[:remove]
    session[:carts].delete(params[:remove])
    end

	end


end
