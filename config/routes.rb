Rails.application.routes.draw do
  namespace :users do
      resources :details
      resources :categories
      resources :homes, only: [:index]
  end

  root 'users/homes#index'

  namespace :admins do
    resources :genres
    resources :categories
    resources :details, only: [:index]
  end
  
  
  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
    get 'admins/sign_up' => 'admins/registrations#new', as: 'new_admin_registration'
    post 'admins' => 'admins/registrations#create', as: 'admin_registration'
    get 'admins/password/new' => 'admins/passwords#new', as: 'new_admin_password'
  end
  devise_for :users, skip: :all
  devise_scope :user do
    get 'users/sign_in' => 'users/sessions#new', as: 'new_user_session'
    post 'users/sign_in' => 'users/sessions#create', as: 'user_session'
    delete 'users/sign_out' => 'users/sessions#destroy', as: 'destroy_user_session'
    get 'users/sign_up' => 'users/registrations#new', as: 'new_user_registration'
    post 'users' => 'users/registrations#create', as: 'user_registration'
    get 'users/password/new' => 'users/passwords#new', as: 'new_user_password'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
