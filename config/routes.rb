Rails.application.routes.draw do
  root to: 'pages#home'
  resources :worktimes
  get 'signup', to: 'users#new'
  resources :users, except: [:new] do
    collection do
      get ':id/:date/detail' => 'users#detail', as: :detail
      get ':id/profilo' => 'users#profilo', as: :profilo
    end
  end
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'online', to: 'worktimes#online'
  post 'offline', to: 'worktimes#offline'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
