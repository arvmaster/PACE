module ApplicationHelper
  #Agregado para tener permisos en varias partes
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
        render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#',class: 'add_fields btn btn-info', data: {id: id, fields: fields.gsub("\n","")})
  end

  def resource_name
    :user
  end
  def resource
    @resource ||= User.new
  end
  def resource_class
    User
  end
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
end
