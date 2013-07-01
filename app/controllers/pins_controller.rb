class PinsController < ApplicationController
  def index
  	@pins = Pin.scoped
  end

  def load
    pins = if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @category.pins.order("created_at DESC")
    else
      Pin.scoped.order("created_at DESC")
    end

    @pins = pins.page(params[:pins_page]).per(10)
  end

  def new
    images = Pin.find_images_from_url(params[:surl])
    @url_img = params[:surl]
    @title_img = images.last
    images.pop
    @images = images
  	@pin = Pin.new
  end
  
  def url_load
  end

  def create
  	@pin = current_user.pins.build(params[:pin])
  	render 'new' unless @pin.save!
  end
end