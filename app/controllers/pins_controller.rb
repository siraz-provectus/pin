class PinsController < ApplicationController
  def index
  	@pins = Pin.scoped
  end

  def new
  	@pin = Pin.new
  end

  def create
  	@pin = current_user.pins.build(params[:pin])
  	if @pin.save
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end
end
