class Comic < ApplicationRecord
  mount_uploader :comic_cover_image, ImageUploader
  include Order

  #associations
  belongs_to :publisher

  has_many :character_comics
  has_many :characters, :through => :character_comics

  
end
