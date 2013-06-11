class Pin < ActiveRecord::Base
  attr_accessible :price, :title, :url, :user_id, :image
  
  belongs_to :user

  validates :title, :url, presence: true

  mount_uploader :image, ImageUploader
end
