Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'emmends#index'

  devise_for :users

  resources :emmends do
    resources :supports, only: [:create]
  end

  resources :supports, only: [:destroy]

end
