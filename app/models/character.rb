class Character < ApplicationRecord
  mount_uploader :character_image, ImageUploader

  #validations
  validates :name, presence: true
  validates :bio, presence: true
  #################################

  #associations
  belongs_to :publisher
  has_many :character_comics
  has_many :comics, :through => :character_comics
  ####################################################################### 
end
