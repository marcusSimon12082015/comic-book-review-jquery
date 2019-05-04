class ComicsController < ApplicationController
  before_action :set_comic, only:[:show,:edit]

  def index
    if params[:search]
      @comics = Comic.searchByPublisher(params[:search]).sortOption(params[:search])
    else
      @comics = Comic.all.customOrder('release_date')
    end
  end

  def show
  end

  def create
    @comic = Comic.new(comics_params)
    authorize @comic
    if @comic.save
      respond_to do |format|
        format.html { redirect_to @comic, success: 'Comic was successfully created!'}
      end
    else
      render :action => 'new'
    end
  end

  def new
    @comic = Comic.new
  end

  def best_sellers
    @comics = Comic.best_sellers
  end

  private

  
end
