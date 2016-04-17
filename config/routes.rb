BackBurner::Application.routes.draw do
  # devise_for :chefs
  root "welcome#index"
  devise_for :chefs, controllers: {
        :registrations => "chef/registrations"
      }

  resources :posts, only: [:index]
end
