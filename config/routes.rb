Rails.application.routes.draw do
  # Routes for main resources
  resources :project_roles do
    collection do
      get 'user_names'
    end
  end
  resources :projects do
    collection do
      get 'categories'
      get 'genre'
      get 'set_last_proj'
    end
  end
  resources :users
  resources :sessions

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  
  # Authentication routes
  get 'user/edit' => 'users#edit', as: :edit_current_user
  get 'signup' => 'users#new', as: :signup
  get 'logout' => 'sessions#destroy', as: :logout
  get 'login' => 'sessions#new', as: :login

  # Semi-static page routes
  get 'home' => 'home#home', as: :home
  get 'about' => 'home#about', as: :about
  get 'contact' => 'home#contact', as: :contact
  get 'privacy' => 'home#privacy', as: :privacy

  # Set the root url
  root :to => 'home#home'  
end
