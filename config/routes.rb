Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'emmends#index'

  resources :users do
    resources :supports, only: [:new, :create, :delete]

  end

  resources :emendas, only: [:destroy]

end
