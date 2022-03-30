class ApplicationController < ActionController::Base
  before_action :configure_devise_params, if: :devise_controller?

  def inicio
  end
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || estaticas_path
  end
  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:name, :role,
                  :superviser, :nationality,
                  :recinto_id, :estudio_id,
                  :first_last_name, :second_last_name,
                  :dni, :born_date,
                  :commune,:address,
                  :academic_level, :registration_date,
                  :specialization_branch, :phone,
                  :active, :email,
                  :password, :password_confirmation)
    end
  end

end
