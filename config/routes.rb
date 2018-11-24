Rails.application.routes.draw do
  devise_for :users, controllers: { 
  	:sessions            => 'users/sessions',
    :registrations      => 'users/registrations',
    # :omniauth_callbacks => "accounts/omniauth_callbacks" ,
    :invitations        => 'users/invitations',
    :confirmations      => 'users/confirmations',
    :passwords          => 'users/passwords'
  }
  devise_scope :user do
    delete 'logout', to: 'devise/sessions#destroy'
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # resources :users
  get 'pages/index'
  root 'pages#index'
  
		  

  namespace :api do
    namespace :v1, defaults: { format: :json } do
    	mount_devise_token_auth_for 'User', at: 'users', controllers: {
		    registrations:  'api/v1/registrations', 	as: :new_user_api_registration_path,
		    sessions:  			'api/v1/sessions', 				as: :user_api_session_path,
		    passwords:  		'api/v1/passwords', 			as: :new_user_api_password_path
		  }
      devise_scope :user do
        get :status, to: 'api#status'
        resources :users, only: :show
        resource :user, only: :update do
          get :profile
        end
      end
    end
  end
  
end
