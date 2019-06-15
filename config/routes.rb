Rails.application.routes.draw do
  root to: 'home#index'

  resources :result_tweets, only: [:index]

  namespace :results do
    match 'ranking', to: 'ranking#index', via: [:get]
    match 'recommended_lines', to: 'recommended_lines#index', via: [:get]
  end

  namespace :pages do
    match 'check_my_vote', to: 'check_my_vote#index', via: [:get, :post]
    match 'staffs', to: 'staffs#index', via: [:get]
  end
end
