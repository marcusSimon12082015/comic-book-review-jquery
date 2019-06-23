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

  def next_link(comic_id=0)
    if comic_id > 0
      @review = Review.where('comic_id = ? and created_at < ?',comic_id,created_at).last
      if @review.nil?
        return ""
      else
        return comic_review_path(comic_id,@review.id)
      end
    else
      @review = Review.where('created_at < ?',created_at).last
      if @review.nil?
        return ""
      else
        return review_path(@review)
      end
    end
  end 
end
