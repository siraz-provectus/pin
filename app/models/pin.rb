class Pin < ActiveRecord::Base
  attr_accessible :price, :title, :url, :image, :category_ids
  
  belongs_to :user
  belongs_to :friend
  has_many :comments
  
  has_many :pincategories
  has_many :categories, through: :pincategories

  validates :title, :url, presence: true

  mount_uploader :image, ImageUploader
end
