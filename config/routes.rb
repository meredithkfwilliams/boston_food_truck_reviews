Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :vendors, only: [:index, :show, :edit, :update]

  resources :vendors do
    resources :locations
  end

  resources :vendors, only: [:index, :show] do
    resources :reviews
  end

  resources :locations

end
