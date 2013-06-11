#encoding: utf-8
class HomeController < ApplicationController	
	def index
		#@users = User.all
		@pins = Pin.all
	end
end
