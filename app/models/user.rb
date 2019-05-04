class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #user roles
  enum role:[:standard,:admin]
  #####################################################

  #associations
  has_many :user_comics, dependent: :destroy
  has_many :comicsofUser, :through => :user_comics, :source => 'comic'

  has_many :reviews
  has_many :comic_reviews, :through => :reviews, :source => 'comic'
  #################################################################################
end
