class ApplicationController < ActionController::Base
  layout :probando_layout
  before_action :configure_devise_params, if: :devise_controller?

  def inicio
  end

  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:nombre_user, :recinto_id, :estudio_id,:apellido_pa, :apellido_ma, :rut, :fecha_nacimiento, :comuna,:direccion, :nivel_estudio, :fecha_ingreso, :especialidad, :telefono, :estado, :email, :password, :password_confirmation)
    end
  end

  def probando_layout
    if user_signed_in?
      "application"
    else
      "inicio"
    end
  end
end
