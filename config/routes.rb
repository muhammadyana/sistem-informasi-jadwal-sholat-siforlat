Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: { 
  	:sessions            => 'users/sessions',
    :registrations      => 'users/registrations',
    # :omniauth_callbacks => "accounts/omniauth_callbacks" ,
    :invitations        => 'users/invitations',
    :confirmations      => 'users/confirmations',
    :passwords          => 'users/passwords'
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # resources :users
  get 'pages/index'
  root 'pages#index'
  
  # mount_devise_token_auth_for 'User', at: '/api/v1/users', controllers: {
  #   registrations:  'api/v1/registrations',
  #   sessions:  'api/v1/sessions',
  #   passwords:  'api/v1/passwords'
  # }

  # namespace :api do
  #   namespace :v1, defaults: { format: :json } do
  #     devise_scope :user do
  #       get :status, to: 'api#status'
  #       resources :users, only: :show
  #       resource :user, only: :update do
  #         get :profile
  #       end
  #     end
  #   end
  # end
  
end
