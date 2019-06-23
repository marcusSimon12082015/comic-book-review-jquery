class ReviewsController < ApplicationController
  before_action :set_review, only:[:show,:edit]

  def index
    if params.key?(:comic_id)
      @comic_id = params[:comic_id].to_i
      @reviews = Review.searchByComic(params[:comic_id])
    else
      @reviews = Review.customOrder('created_at')
    end

    @comic_id = @comic_id.nil? ? 0 : @comic_id

    respond_to do |format|
      format.html
      format.json { render json:@reviews, comic_id: @comic_id}
    end
  end

  def show
    if params.key?(:comic_id)
      @comic_id = params[:comic_id].to_i
    end

    @comic_id = @comic_id.nil? ? 0 : @comic_id

    @next = @review.next_link(@comic_id)
    @previous = @review.previous_link(@comic_id)

    respond_to do |format|
      format.html
      format.json { render json:@review, comic_id: @comic_id}
    end
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
