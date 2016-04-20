BackBurner::Application.routes.draw do
  devise_for :cooks, controllers: { sessions: 'sessions' }
  devise_for :chefs, controllers: { sessions: 'sessions' }

  root "welcome#index"

  resources :posts, only: [:index, :new, :create, :update] do
    resources :signups, only: [:create]
  end

  resources :chefs, only: [:show]
  resources :cooks, only: [:show]
end
