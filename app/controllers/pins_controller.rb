class PinsController < ApplicationController
  def index
  	@pins = Pin.scoped
  end

  def load
    @pins = Pin.scoped.page(params[:pins_page]).per(10)
  end

  def new
  	@pin = Pin.new
  end

  def create
  	@pin = current_user.pins.build(params[:pin])
  	render 'new' unless @pin.save 
  end
end
