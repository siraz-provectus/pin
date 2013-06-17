class Comment < ActiveRecord::Base
  attr_accessible :comment, :pin_id

  belongs_to :user
  belongs_to :pin

  validates :comment, presence: true
end
