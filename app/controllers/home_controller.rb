class HomeController < ApplicationController
	def index
		@pins = Pin.all
	end
end
