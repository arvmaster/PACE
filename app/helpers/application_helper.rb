module ApplicationHelper
  #Agregado para tener permisos en varias partes
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
