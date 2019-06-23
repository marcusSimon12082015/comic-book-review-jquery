class Comment < ActiveRecord::Base
  #associations
  belongs_to :user
  belongs_to :review
  #####################################################

  #validations
  validates :content, presence: true
  #######################################################
end
