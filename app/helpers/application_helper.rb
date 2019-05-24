module ApplicationHelper
  def full_title title = ""
    base_title = "Pato Restaurant"
    if title.empty?
      base_title
    else
      title + " | " + base_title
    end
  end
  
  def raise_image_title title = ""
    title = "home" if title.empty?
    if title.empty?
      title = "home"
    end
    content_tag(:section,
      content_tag(:h2, title, class: "tit6 t-center"),
      class: "bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15",
      style: "background-image: url(#{image_path "bg-title-#{title}-page.jpg"});")
  end
end
