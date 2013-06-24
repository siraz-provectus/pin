#encoding: utf-8
class HomeController < ApplicationController	
	def index
		@user = User.all

		pins = if params[:category_id].present?
			@category = Category.find(params[:category_id])
			@category.pins.order("created_at DESC")
		else
			Pin.scoped.order("created_at DESC")
		end

		@pins = pins.page(params[:pins_page]).per(10)
		
		if user_signed_in? 
		  @friendpins = current_user.friendpins.order("created_at DESC").page(params[:friend_page]).per(5)
		end
	end
end
