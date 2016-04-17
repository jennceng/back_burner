BackBurner::Application.routes.draw do
  devise_for :chefs
  root "welcome#index"

  resources :posts, only: [:index]
end
