Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :vendors do
    resources :reviews, only: [:create, :destroy]
  end

  resources :locations, only: [:index, :show]

end
