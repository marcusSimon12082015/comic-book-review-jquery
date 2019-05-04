class Review < ApplicationRecord
  include Order

  #validations
  validates :title, presence: true
  validates :content, presence: true
  #########################################################################

  #associations
  belongs_to :user
  belongs_to :comic
  ############################################################################

  def self.searchByComic(id)
    where('comic_id = ?',id).customOrder('created_at')
  end 
end
