Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"

  resources :profile, except: [:show]

  get 'demo' => 'demo#show'
  get 'demo/:user_id' => 'demo#get_profiles'
end
