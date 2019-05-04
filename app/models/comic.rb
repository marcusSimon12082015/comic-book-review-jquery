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
  validates :price, presence: true, numericality: {:greater_than => 0.0}
  validates :pages, presence: true, numericality: {:greater_than => 0.0}
  validates_associated :artists
  ###########################################################################

  def removeCurrentUser(user)
    user.nil? ? users_comics : users_comics.where.not(id:user.id)
  end

  def artists_attributes=(attributes)
    attributes.each do |index,artist|
      if !find_artist(artist)
        self.artists << Artist.find_or_create_by(name:artist["name"],
                        surname:artist["surname"],
                        type_id:artist["type_id"].to_i)
      end
    end
  end

  def find_artist(current)
    self.artists.any?{|artist|
      artist.name == current["name"] &&
      artist.surname == current["surname"] &&
      artist.type_id == current["type_id"].to_i
    }
  end

  #class methods
  def self.searchByPublisher(search)
    attribute_value = search[:publisher_id] ||= ""

    if attribute_value.empty?
      where("publisher_id = ?",attribute_value)
    else
      all
    end
  end

  def self.sortOption(search)
    sort_option = search[:sort_order]
    if sort_option == 'rating'
      customOrder('rating',:sort => "DESC")
    else
      customOrder('release_date', :sort => sort_option)
    end
  end

  def self.best_sellers
    select("#{self.table_name}.*, COUNT(comic_id) AS user_count")
    .joins(:user_comics)
    .group(:comic_id)
    .order("user_count DESC")
  end
  ############################################################################
end
