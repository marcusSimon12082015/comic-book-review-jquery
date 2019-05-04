class ReviewsController < ApplicationController
  before_action :set_review, only:[:show,:edit]

  def index
    if params.key?(:comic_id)
      @reviews = Review.searchByComic(params[:comic_id])
    else
      @reviews = Review.customOrder('created_at')
    end
  end

  def show
  end

  def new
    @review = Review.new
    @comic = Comic.find(params[:comic_id])
  end

  def create
    @review = Review.new(reviews_params)
    @comic = Comic.find(params[:comic_id])
    @review.comic = @comic
    @review.user = current_user
    if @review.save
      respond_to do |format|
        format.html { redirect_to @review, success: 'Review was successfully created!' }
      end
    else
      @comic = Comic.find(params[:comic_id])
      render :new
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def reviews_params
    params.require(:review).permit(:title,:content,:comic_id)
  end
end
