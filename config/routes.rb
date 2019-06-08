Rails.application.routes.draw do
  root to: 'home#index'

  namespace :pages do
    match 'check_my_vote', to: 'check_my_vote#index', via: [:get, :post]
  end
end
# http://localhost:3000/pages/check_my_vote