Rails.application.routes.draw do

  scope 'dashboard' do
    get '/', to: 'dashboard#index', as: :dashboard
    resources :mosques, only: [:index]
    resources :users, except: [:new, :create, :update, :edit, :destroy] do
      resources :mosques, path: 'mosque', except: [:create, :index] do
        
      end
      post 'mosque', to: 'mosques#create', as: :create_mosque
      patch 'mosque', to: 'mosques#create'
    end

  end

  devise_for :users, controllers: { 
  	:sessions             => 'users/sessions',
    :registrations        => 'users/registrations',
    # :omniauth_callbacks => "users/omniauth_callbacks" ,
    :invitations          => 'users/invitations',
    :confirmations        => 'users/confirmations',
    :passwords            => 'users/passwords'
  }
  
  devise_scope :user do
    delete 'logout', to: 'devise/sessions#destroy'
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'pages/index'
  root 'pages#index'
  
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get 'prayer-times/:duration', to: 'prayer_times#index'
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
