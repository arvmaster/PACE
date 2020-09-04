Rails.application.routes.draw do

  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }
  root 'estaticas#home'
  namespace :user do
    root :to => "estaticas#index"
  end
  resources :estaticas
  resources :archivos
  resources :cuestionarios
  resources :pregunta_cuestionarios
  resources :recintos
  resources :informes
  resources :pregunta_informes
  resources :eventos
  resources :user_eventos
  #users personalizados
  resources :users do
    collection {post :import}
  end
  resources :datos_carreras do
    collection {post :import}
  end
  resources :estudios do
    collection {post :import}
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
