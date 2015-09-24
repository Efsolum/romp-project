module ApplicationHelper
  def image_asset(image, options = {})
    image_tag("/assets/images/" + image, options)
  end

  def icon_asset(icon, options = {})
    image_tag("/assets/icons/" + icon, options)
  end
end
