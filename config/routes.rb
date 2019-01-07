Cfp::Application.routes.draw do
  get "home/show"

  match '/auth/:provider/callback' => 'authentications#create'

  devise_for :users, :controllers => {
    :registrations => 'r  egistrations',
    :sessions      => 'sessions',
    :passwords     => 'passwords'
  }

  resource :profile
  resources :papers
  resources :authentications

  namespace :admin do
    resources :papers do
      member do
        post :upvote
        post :downvote
      end
    end
    resources :users
    root :to => "papers#index"
  end
  root :to => "home#show"
end
