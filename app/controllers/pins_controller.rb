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
    @images = []
    doc = Nokogiri::HTML(open(params[:surl]))
    if params[:surl].include?('ozon.ru')
      site = 'ozon.ru'
    end
    if params[:surl].include?('feelunique.com')
      site = 'feelunique.com'
    end
    if params[:surl].include?('yoox.com')
      site = 'yoox.com'
    end
    if params[:surl].include?('asos.com')
      site = 'asos.com'
    end

    case site
      when 'ozon.ru'
        if doc.at_css('#detailGalleryMini .l-gallery .gallery-items .gallery-group').present?
          doc.css('#detailGalleryMini .l-gallery .gallery-items .gallery-group ul img').each do |image|
            @images << image.attributes["src"].value.gsub("l60", "c200")
          end
        else
          doc.css('#detailGalleryMini .l-img img').each do |image|
              @images << image.attributes["src"].value
          end
        end
      when 'feelunique.com'
        doc.css('.main-image').each do |image|
          @images << image.attributes["src"].value
        end
      when 'yoox.com'
        doc.css('#itemThumbs img').each do |image|
          @images << image.attributes["src"].value.gsub("_9_", "_10_")
        end
      when 'asos.com'
        @images << doc.at_css('#mainView img').attributes["src"].value
        doc.css('#additionalViews img').each do |image|
          @images << image.attributes["src"].value.gsub("small", "large")
        end
      else
        doc.css("img").each do |image|
          @images << image.attributes["src"].value
        end
    end

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