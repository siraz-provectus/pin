class PinsController < ApplicationController
  def index
  	@pins = Pin.scoped
  end

  def load
    pins = if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @category.pins
    else
      Pin.scoped
    end

    @pins = pins.page(params[:pins_page]).per(10)
  end

  def new
    @doc = Nokogiri::HTML(open(params[:surl]))
  	@pin = Pin.new
  end
  
  def url_load
    #@pin = Pin.new
  end

  def create
  	@pin = current_user.pins.build(params[:pin])
  	render 'new' unless @pin.save 
  end
end
