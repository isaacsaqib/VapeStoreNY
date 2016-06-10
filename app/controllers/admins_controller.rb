class AdminsController < ApplicationController
	def new
		@admin = Admin.new

	end

	def create
		@admin = Admin.create(admin_params)
			if @admin.save 
				redirect_to "/"
			else
				render :new
			end

	end

	def admin_params 
		params.require(:admin).permit(:username, :password, :password_confirmation)
	end



end
