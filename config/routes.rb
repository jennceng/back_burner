BackBurner::Application.routes.draw do
  devise_for :cooks, controllers: { sessions: 'sessions' }
  devise_for :chefs, controllers: { sessions: 'sessions' }

  root "welcome#index"

  resources :posts, only: [:index, :create]
end
