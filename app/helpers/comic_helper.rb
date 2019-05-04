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

  def displayAddButton(user,comic)
    if !user.nil? && user.comicsofUser.find_by_id(comic.id).nil? && !user.admin?
      button_to("Add to My Collection",add_comic_to_user_path(@comic),class:"add-to-collection")
    end
  end

  def displayCoverImage(comic)
    comic.comic_cover_image.file.nil? ? "/assets/cover_not_available_360.jpg"
                                      : comic.comic_cover_image.url.to_s
  end

  def displayNewComicLink(user)
    if user.present? && user.admin?
      content_tag(:li, link_to("New Comic",new_comic_path))
    end
  end
end
