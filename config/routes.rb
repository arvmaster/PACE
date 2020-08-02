Rails.application.routes.draw do

  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }
  root 'inicio#index'

  #users personalizados
  resources :users

  resources :inicio
  resources :archivos
  resources :cuestionarios
  resources :pregunta_cuestionarios do
               collection do
                 put :valor
               end
             end

  resources :datos_carreras
  resources :recintos
  resources :estudios
  resources :informes
  resources :pregunta_informes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
