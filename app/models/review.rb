class Review < ApplicationRecord
  include Order
  include Rails.application.routes.url_helpers
  
  #validations
  validates :title, presence: true
  validates :content, presence: true
  #########################################################################

  #associations
  belongs_to :user
  belongs_to :comic
  has_many :comments
  ############################################################################

  def self.searchByComic(id)
    where('comic_id = ?',id).customOrder('created_at')
  end
end
