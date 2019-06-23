class ReviewSerializer < ActiveModel::Serializer

  attributes :id,:title,:content,:comments
  belongs_to :user
  belongs_to :comic

  def comments
    ActiveModel::SerializableResource.new(object.comments, each_serializer: CommentSerializer)
  end

  attribute :links do
    {
      
    }
  end
end
