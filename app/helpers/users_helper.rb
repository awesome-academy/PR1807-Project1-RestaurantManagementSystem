module UsersHelper
  def gravatar_for user, options = { size: 80, admin: false }
    size = options[:size]
    admin = options[:admin]
    gravatar_url = "gravatar.jpg"
    if admin
      link_to image_tag(gravatar_url, alt: user.name, width: size, height: size,
        class: "gravatar"), admin_user_path(user.id)
    else
      link_to image_tag(gravatar_url, alt: user.name, width: size, height: size,
        class: "gravatar"), user
    end
  end

  def correct_user? user
    current_user?(user) || current_user.admin?
  end
end
