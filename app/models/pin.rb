class Pin < ActiveRecord::Base
  attr_accessible :price, :title, :url, :user_id
  belongs_to :user
end
