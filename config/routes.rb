Rails.application.routes.draw do
  resources :specs
  resources :functions
  resources :requirements
  resources :sections
  resources :chapters
  resources :specifications
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
