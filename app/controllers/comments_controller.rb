class CommentsController < ApplicationController
  def index

  end

  def create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.build(comments_params)
    @comment.user = current_user
    if @comment.save
      render json: @comment
    else
      render json: {message:"Validation failed", errors:@comment.errors}, status:400
    end
  end

  def comments_params
    params.require(:comment).permit(:content,:review_id)
  end
end 
