module UserHelper
  def displayUser(user)
    if user.present? && !user.admin?
      content_tag :li, {} do
        link_to user_path(user), {} do
          content_tag :p, ('<ion-icon name="person"></ion-icon>'+user.firstEmailPart).html_safe
        end
      end
    end
  end

  def displayUserImage(user)
    user.user_image.file.nil? ? "/assets/image_not_available.jpg"
                              : user.user_image.url.to_s
  end
end
