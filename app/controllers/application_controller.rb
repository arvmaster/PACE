class ApplicationController < ActionController::Base
  #before_action :authenticate_user!, except: [:inicio]
  before_action :configure_devise_params, if: :devise_controller?

  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:nombre_user, :apellido_pa, :apellido_ma, :rut, :fecha_nacimiento, :comuna,:direccion, :nivel_estudio, :fecha_ingreso, :especialidad, :telefono, :estado, :email, :password, :password_confirmation)
    end
  end
end
