#encoding: utf-8
class HomeController < ApplicationController	
	def index
		@users = User.all
		@pins = Pin.all

		if user_signed_in? 
		  @friend_pin = @pins.sort! { |a,b| b.created_at <=> a.created_at} 
		end
	end
end
