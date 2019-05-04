module ArtistsHelper
  def displayArtistImage(artist)
    artist.artist_image.file.nil? ? "/assets/image_not_available.jpg"
                                    : artist.artist_image.url.to_s
  end
end
