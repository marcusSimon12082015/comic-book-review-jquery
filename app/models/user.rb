class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable

  #user roles
  enum role:[:standard,:admin]
  #####################################################

  #associations
  has_many :user_comics, dependent: :destroy
  has_many :comicsofUser, :through => :user_comics, :source => 'comic'

  has_many :reviews
  has_many :comic_reviews, :through => :reviews, :source => 'comic'
  #################################################################################

  def firstEmailPart
    email[0,email.index('@')]
  end

  def add_comic_to_user(comic)
    if self.credits >= comic.price.to_i
      self.comicsofUser << comic
      self.credits -= comic.price.to_i
      self
    else
      return nil
    end
  end

  #for third party authentication
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
  ##############################################################################
end
