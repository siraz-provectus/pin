class Category < ActiveRecord::Base
  attr_accessible :title

  has_many :pincategories
  has_many :pins, through: :pincategories
end
