Rails.application.routes.draw do
  root 'carros#index'
  resources :carros
  resources :marcas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
