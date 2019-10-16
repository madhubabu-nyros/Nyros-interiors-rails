Rails.application.routes.draw do
 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admins
  #Routes for users
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
  #Routes for authentication
  namespace :api do
    namespace :v1 do
      resources :authentication
    end
  end
  #Routes for rooms
  namespace :api do
    namespace :v1 do
      resources :rooms
    end
  end
  #Routes for goals
  namespace :api do
    namespace :v1 do
      resources :goals
    end
  end
  #Routes for styles
  namespace :api do
    namespace :v1 do
      resources :styles
    end
  end
  #Routes for user_requirement_styles
  namespace :api do
    namespace :v1 do
      resources :user_requirement_styles
    end
  end
  #Routes for user_requirements
  namespace :api do
    namespace :v1 do
      resources :user_requirements
    end
  end
  #Routes for user_requirement_goals
  namespace :api do
    namespace :v1 do
      resources :user_requirement_goals
    end
  end
  #Routes for user_requirements in admin panel
  namespace :admin do
    resources :user_requirements
  end
  devise_scope :admin do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end
