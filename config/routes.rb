Rails.application.routes.draw do
  root to: 'dashboard#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :dashboard
end

