class ComicsController < ApplicationController
  before_action :set_comic, only:[:show,:edit]

  def index
    if params[:search]
      @comics = Comic.searchByPublisher(params[:search]).sortOption(params[:search])
    else
      @comics = Comic.all.customOrder('release_date')
    end
  end 

end
