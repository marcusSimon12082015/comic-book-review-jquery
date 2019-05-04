class UserComicsController < ApplicationController
  def add_comic_to_user
    @comic = Comic.find_by_id(params[:comic_id])
    if !current_user.add_comic_to_user(@comic).nil?
      if current_user.save
        flash[:success] = "Comic successfully added to your collection!!!"
      else
        flash[:danger] = "There was an error while processing!!!"
      end
    else
      flash[:info] = "You don't have enough credits to purchase this comic!!!"
    end
    redirect_to comics_path
  end
end
