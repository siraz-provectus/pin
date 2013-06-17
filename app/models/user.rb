class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name, :avatar

  has_many :pins
  has_many :comments

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :friendpins, through: :friends, class_name: "Pin", source: :pins

  has_many :inverse_friendships, 
    class_name: "Friendship", 
    foreign_key: :friend_id

  has_many :inverse_friends, 
    through: :inverse_friendships, 
    source: :user

 # has_many :inverse_friendpins, 
  #  through: :inverse_friends, 
 #   source: :pin


  validates :first_name, :last_name, presence: true

  mount_uploader :avatar, AvatarUploader
  
  def full_name
    [ first_name, last_name ].join(' ')
  end
end
