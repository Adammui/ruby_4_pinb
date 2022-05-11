Rails.application.routes.draw do
  resources :roles
  devise_for :users
  resources :users
  resources :advertisements do
    resources :comments
  end
  resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'sign_out', to: 'sessions#destroy'
  get 'sign_up',to: redirect('/users/sign_up'), as: 'sign_up'
  get 'auth/failure', to: redirect('/')
  get 'token_auth', to: 'sessions#token_auth', as: 'token_auth'
  get 'create_post', to: 'advertisements#create_api', as: 'create_post'
  get 'update_post', to: 'advertisements#update_api', as: 'update_post'
  get 'delete_post', to: 'advertisements#destroy_api', as: 'delete_post'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  root 'advertisements#index'
end
