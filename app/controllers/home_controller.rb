#encoding: utf-8
class HomeController < ApplicationController	
	def index
		@pins = Pin.all
	end
end
