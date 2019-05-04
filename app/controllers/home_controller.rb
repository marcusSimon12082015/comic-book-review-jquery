class HomeController < ApplicationController
  layout "home_layout"

  def index
    @comics = Comic.customOrder('release_date',:limit=>4)
    @artists = Artist.customOrder('name',:limit=>4)
    @reviews = Review.customOrder('created_at',:limit=>4)
  end
end
