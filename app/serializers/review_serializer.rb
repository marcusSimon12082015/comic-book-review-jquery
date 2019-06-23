class ReviewSerializer < ActiveModel::Serializer

  attributes :id,:title,:content,:comments
  belongs_to :user
  belongs_to :comic

  def comments
    ActiveModel::SerializableResource.new(object.comments, each_serializer: CommentSerializer)
  end

  attribute :links do
    {
      next: generate_next_link,
      previous: generate_previous_link
    }
  end

  def generate_next_link
    object.next_link(instance_options[:comic_id])
  end

  def generate_previous_link
    object.previous_link(instance_options[:comic_id])
  end
end
