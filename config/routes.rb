Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
  end

  resources :users, only: [:show, :edit, :update]
  resources :users do
    resources :profiles, only: [:show, :edit, :update]
  end
  resources :events, only: [:index]
  root 'home#index'
end
