Rails.application.routes.draw do
  root to: 'home#index'

  resources :result_tweets, only: [:index]
  resources :results, only: [:index]

  namespace :pages do
    match 'check_my_vote', to: 'check_my_vote#index', via: [:get, :post]
    match 'staffs', to: 'staffs#index', via: [:get]
  end
end
