Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :advertisements do
    resources :comments
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'sign_out', to: 'sessions#destroy'
  get 'auth/failure', to: redirect('/')
  get 'me', to: 'users#show', as: 'me'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  root 'users#index'
end
