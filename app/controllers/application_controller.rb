class ApplicationController < ActionController::Base
  before_action :configure_devise_params, if: :devise_controller?

  def inicio
  end
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || estaticas_path
  end
  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:nombre_user, :rol, :supervisar, :nacionalidad, :recinto_id, :estudio_id,:apellido_pa, :apellido_ma, :rut, :fecha_nacimiento, :comuna,:direccion, :nivel_estudio, :fecha_ingreso, :especialidad, :telefono, :estado, :email, :password, :password_confirmation)
    end
  end

end
