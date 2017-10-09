Rails.application.routes.draw do
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users
  resources :specifications, shallow: true do
    resources :chapters, only: [:show, :new, :create, :edit, :update, :destroy], shallow: true do
      resources :sections, only: [:new, :create, :edit, :update, :destroy], shallow: true do
        resources :requirements, only: [:new, :create, :edit, :update, :destroy], shallow: true do
          resources :functions, only: [:new, :create, :edit, :update, :destroy], shallow: true do
            resources :specs, only: [:new, :create, :edit, :update, :destroy]
          end
        end
      end
    end
    resources :members, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  root "specifications#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
