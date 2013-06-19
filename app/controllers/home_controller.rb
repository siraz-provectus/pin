#encoding: utf-8
class HomeController < ApplicationController	
	def index
		@user = User.all

		@pins = 
		if params[:category_id].present?
			@category = Category.find(params[:category_id])
			@category.pins
		else
			Pin.scoped
		end

		if user_signed_in? 
		  @friendpins = current_user.friendpins.sort!{ |a, b| b.created_at <=> a.created_at} 
		end
	end
end
