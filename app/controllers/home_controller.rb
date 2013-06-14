#encoding: utf-8
class HomeController < ApplicationController	
	def index
		@user = User.all
		@pins = Pin.all

		if user_signed_in? 
		  @friendpins = current_user.friendpins.sort!{ |a, b| b.created_at <=> a.created_at} 
		end
	end
end
