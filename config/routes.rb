Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :vendors

  resources :vendors do
    resources :locations
  end

  resources :vendors do
    resources :reviews
  end

  resources :locations

end
