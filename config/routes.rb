Rails.application.routes.draw do
  resources :spec_keywords, only: [:index, :create, :destroy]
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users do
    member do
      post :activate
    end
  end
  resources :projects, shallow: true do
    resources :specifications, only: [:show, :new, :create, :edit, :update, :destroy], shallow: true do
      resources :chapters, only: [:show, :new, :create, :edit, :update, :destroy], shallow: true do
        resources :sections, only: [:new, :create, :edit, :update, :destroy], shallow: true do
          resources :requirements, only: [:new, :create, :edit, :update, :destroy], shallow: true do
            resources :functions, only: [:new, :create, :edit, :update, :destroy], shallow: true do
              resources :specs, only: [:new, :create, :edit, :update, :destroy]
            end
          end
        end

        resources :sheets, only: [:new, :create, :edit, :update, :destroy], shallow: true
      end
      member do
        get :search
      end
    end
    resources :members, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :keywords, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  root "projects#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
