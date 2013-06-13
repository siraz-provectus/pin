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

  has_many :friendships
  has_many :friends, through: :friendships

<<<<<<< HEAD
  has_many :inverse_friendships,
    class_name: "Friendship",
    foreign_key: :friend_id

  has_many :inverse_friends,
    through: :inverse_friendships,
=======
  has_many :inverse_friendships, 
    class_name: "Friendship", 
    foreign_key: :friend_id

  has_many :inverse_friends, 
    through: :inverse_friendships, 
>>>>>>> b682a2909ffa2e7bcf79e7f1fbd8322950db6186
    source: :user

  validates :first_name, :last_name, presence: true

  mount_uploader :avatar, AvatarUploader
  
  def full_name
    [ first_name, last_name ].join(' ')
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> b682a2909ffa2e7bcf79e7f1fbd8322950db6186
