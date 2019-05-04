class Artist < ApplicationRecord
  mount_uploader :artist_image, ImageUploader
  include Order

  #validations
  validates :name, presence: true
  validates :surname, presence: true

  validates :name, format: { with: /\A[a-zA-Z]+\z/ }
  #######################################################

  #associations
  belongs_to :type

  has_many :artist_comics
  has_many :comics, :through => :artist_comics
  #####################################################################

  def nameType
    name + " - " + type.name
  end

  def nameSurname
    name + " " + surname
  end
end
