class ArtistComic < ApplicationRecord
  belongs_to :artist
  belongs_to :comic 
end
