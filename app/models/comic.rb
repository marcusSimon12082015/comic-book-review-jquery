class Comic < ApplicationRecord
  mount_uploader :comic_cover_image, ImageUploader
  include Order

  #associations
  belongs_to :publisher

  has_many :character_comics
  has_many :characters, :through => :character_comics

  has_many :artist_comics
  has_many :artists, :through => :artist_comics
  accepts_nested_attributes_for :artists, reject_if:
    lambda {|attributes| attributes['name'].blank? || attributes['surname'].blank? ||
      attributes['type_id'].blank?}

  has_many :user_comics, dependent: :destroy
  has_many :users_comics, :through => :user_comics, :source => "user"

  has_many :reviews
  has_many :user_reviews, :through => :reviews, :source => "user"
  ###############################################################################

  #validations
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numerically: {:greater_than => 0.0}
  validates :pages, presence: true, numerically: {:greater_than => 0.0}
  validates_associated :artists
  ###########################################################################

end
