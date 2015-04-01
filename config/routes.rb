Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :vendors

  resources :vendors do
    resources :locations
  end

  resources :locations

end
