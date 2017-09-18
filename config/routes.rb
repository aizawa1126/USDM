Rails.application.routes.draw do
  resources :specs, only: [:new, :create, :edit, :update, :destroy]
  resources :functions, only: [:new, :create, :edit, :update, :destroy]
  resources :requirements, only: [:new, :create, :edit, :update, :destroy]
  resources :sections, only: [:new, :create, :edit, :update, :destroy]
  resources :chapters, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :specifications
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
