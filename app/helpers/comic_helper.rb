module ComicHelper
  def displayCoverImage(comic)
    comic.comic_cover_image.file.nil? ? "/assets/cover_not_available_360.jpg"
                                      : comic.comic_cover_image.url.to_s
  end
end
