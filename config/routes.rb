Rails.application.routes.draw do
  root to: 'dashboard#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :dashboard
  resources :workspaces do
    resources :tasks
  end
  resources :users do
    member do
      get :leveling
      post :fight_monster
      post :example_workspaces
    end
  end
end
