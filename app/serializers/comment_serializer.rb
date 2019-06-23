class CommentSerializer < ActiveModel::Serializer
  attributes :id,:content

  belongs_to :review
  belongs_to :user
end
