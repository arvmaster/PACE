Rails.application.routes.draw do
  get 'asignaturas/index'
  root 'inicio#index'

  resources :archivos

  get 'archivos', to: 'archivos#index'
  get 'archivos/new'


  #root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
