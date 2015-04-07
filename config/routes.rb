Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :vendors do
    resources :reviews
  end

  resources :locations

end
