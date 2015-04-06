Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :vendors, only: [:index, :show, :edit, :update, :create] do
    resources :reviews do
      resources :votes
    end
  end

  resources :locations
end
