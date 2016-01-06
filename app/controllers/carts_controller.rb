class CartsController < ApplicationController
	
	def index
    if params[:remove]
    	@validate_cart = session[:carts].count
    session[:carts].delete(params[:remove])
    if @validate_cart==1
    	session.delete(:carts)
    end
    end

	end


end
