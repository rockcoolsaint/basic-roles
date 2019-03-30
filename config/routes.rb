Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticated :user, ->(u) { u.has_role?('super') } do
    root to: 'admin/dashboard#index', as: :admin_user_root
  end

  authenticated :user do
    root 'pages#index'
    get '/home', to: 'pages#index'
  end

  #root to: 'admin/dashboard#index'
end
