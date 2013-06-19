class Pincategory < ActiveRecord::Base
  attr_accessible :category_id, :pin_id

  belongs_to :pin
  belongs_to :category
end
