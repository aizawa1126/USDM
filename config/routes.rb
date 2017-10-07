Rails.application.routes.draw do
  resources :permissions
  resources :operations
  resources :member_roles
  resources :roles
  resources :users
  resources :specs, only: [:new, :create, :edit, :update, :destroy]
  resources :functions, only: [:new, :create, :edit, :update, :destroy]
  resources :requirements, only: [:new, :create, :edit, :update, :destroy]
  resources :sections, only: [:new, :create, :edit, :update, :destroy]
  resources :chapters, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :specifications, shallow: true do
    resources :members, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  root "specifications#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
