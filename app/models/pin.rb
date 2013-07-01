class Pin < ActiveRecord::Base
  attr_accessible :price, :title, :url, :image, :category_ids, :remote_image_url
  
  belongs_to :user
  belongs_to :friend
  has_many :comments
  
  has_many :pincategories
  has_many :categories, through: :pincategories

  validates :title, :url, presence: true

  mount_uploader :image, ImageUploader

  class << self
    def find_images_from_url(url)
	    images = []

	    doc = Nokogiri::HTML(open(url))

	    title_img = doc.at_css("title").text

	    if url.include?('ozon.ru')
	      site = 'ozon.ru'
	    elsif url.include?('feelunique.com')
	      site = 'feelunique.com'
	    elsif url.include?('yoox.com')
	      site = 'yoox.com'
	    elsif url.include?('asos.com')
	      site = 'asos.com'
	    end

	    case site
	      when 'ozon.ru'
	        doc.css('script').text.scan(/(?:\w*)\/(?:\w*)(?:\.[jpgn]{3,3})/).each do |image|
              images << "http://static.ozone.ru/multimedia/" + image
          	end

	      when 'feelunique.com'
	        doc.css('.main-image').each do |image|
	          images << image.attributes["src"].value
	        end

	      when 'yoox.com'
	        doc.css('#itemThumbs .itemThumb img').each do |image|
	          images << image.attributes["src"].value.gsub("_9_", "_11_")
	        end

	      when 'asos.com'
	      	doc.css('script').text.scan(/(?:\w*\/)*(?:\w*)(?:[0-9]{1,1}[xl]{2,2}\.[jpgn]{3,3})/).each do |image|
	          images << "http://images.asos-media." + image
	        end
	      else
	        doc.css("img").each do |image|
	          images << image.attributes["src"].value
	        end
	    end

	    images << title_img

    end
  end
end
