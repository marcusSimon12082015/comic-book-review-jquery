module ReviewsHelper
  def newReviewLink(comic,user)
    if comic.reviews.find_by(user_id:user.id).nil?
      link_to "Create Review", new_comic_review_path(comic),{:class=>"comic-title-link"}
    end
  end
end
