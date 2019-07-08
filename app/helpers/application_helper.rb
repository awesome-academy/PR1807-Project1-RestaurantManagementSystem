module ApplicationHelper
  def full_title title = ""
    base_title = t "shared.pato_restaurant"
    if title.empty?
      base_title
    else
      title + " | " + base_title
    end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "btn btn-primary add_fields m-l-15", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
