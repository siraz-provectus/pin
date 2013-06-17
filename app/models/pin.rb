class Pin < ActiveRecord::Base
  attr_accessible :price, :title, :url, :image
  
  belongs_to :user
  belongs_to :friend
  has_many :comments

  validates :title, :url, presence: true

  mount_uploader :image, ImageUploader
end
