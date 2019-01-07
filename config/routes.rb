Cfp::Application.routes.draw do
  root to: "home#show"

  get "home/show"

  match '/auth/:provider/callback' => 'authentications#create'

  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions: 'sessions',
    passwords: 'passwords'
  }

  resource :profile
  resources :papers
  resources :authentications

  namespace :admin do
    root to: "papers#index"

    resources :papers do
      member do
        post :upvote
        post :downvote
      end
    end
    resources :users

  end
end
