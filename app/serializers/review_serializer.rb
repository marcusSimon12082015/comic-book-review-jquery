class ReviewSerializer < ActiveModel::Serializer

  attributes :id,:title,:content,:comments
  belongs_to :user
  belongs_to :comic 

end
