class CommentSerializer < ActiveModel::Serializer
  attributes :id,:content

  belongs_to :review, serializer: ReviewCommentSerializer 
  belongs_to :user
end
