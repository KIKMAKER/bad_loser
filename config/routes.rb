Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"

  get 'everyone', to: "pages#everyone"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :friendships, only: %i[create index show] do
    resources :boards, only: [:index]
  end

  resources :boards, only: %i[index new create show]

  resources :points, only: [:create]
end
