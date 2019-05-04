module ComicHelper
  def selectedPublisher(search)
    if !search.nil? && search.key?(:publisher_id)
      return search[:publisher_id]
    else
      return 0
    end
  end

  def selectedOrder(search)
    if !search.nil? && search.key?(:sort_order)
      return search[:sort_order]
    else
      return 1
    end
  end

  def displayCoverImage(comic)
    comic.comic_cover_image.file.nil? ? "/assets/cover_not_available_360.jpg"
                                      : comic.comic_cover_image.url.to_s
  end
end
