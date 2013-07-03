class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name, :avatar, :remote_avatar_url
  attr_accessible :nickname, :provider, :url, :username

  validates :first_name, :last_name, presence: true

  has_many :pins
  has_many :comments, dependent: :destroy

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :friendpins, through: :friends, class_name: "Pin", source: :pins

  has_many :inverse_friendships, 
    class_name: "Friendship", 
    foreign_key: :friend_id

  has_many :inverse_friends, 
    through: :inverse_friendships, 
    source: :user


  mount_uploader :avatar, AvatarUploader
  
  def full_name
    [ first_name, last_name ].join(' ')
  end

  def self.find_for_vkontakte_oauth(auth)
    user = where(provider: auth.provider, url: auth.info.urls.Vkontakte).first

    if user.present?
      user.update_attributes(first_name: auth.info.first_name, last_name: auth.info.last_name,
       remote_avatar_url: auth.info.image)
    else
      user = create!(
        nickname: auth.extra.raw_info.domain,
        provider: auth.provider,
        url: auth.info.urls.Vkontakte,
        username: auth.info.name,
        first_name: auth.info.first_name,
        last_name: auth.info.last_name,
        remote_avatar_url: auth.info.image
      )
    end

    user
  end

  def self.find_for_facebook_oauth(auth)
    user = where(provider: auth.provider, url: auth.info.urls.Fasebook).first

    if user.present?
      user.update_attributes(first_name: auth.info.first_name, last_name: auth.info.last_name,
       remote_avatar_url: auth.info.image)
    else
      user = create!(
      nickname: auth.extra.raw_info.username,
      provider: auth.provider,
      url: auth.info.urls.Fasebook,
      username: auth.extra.raw_info.name,
      first_name: auth.info.first_name,
      last_name: auth.info.last_name,
      remote_avatar_url: auth.info.image)
    end
    user
  end

  def self.new_with_session(params, session)
    if session["devise.vkontakte_data"]
      new(session["devise.vkontakte_data"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    elsif session["devise.facebook_data"]
      new(session["devise.vkontakte_data"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def email_required?
    super && provider.blank?
  end

  def password_required?
    super && provider.blank?
  end
end
