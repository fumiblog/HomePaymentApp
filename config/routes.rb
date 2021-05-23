Rails.application.routes.draw do
  namespace :users do
      resources :details
      resources :categories
  end

  root 'users/homes#top'

  namespace :admins do
    resources :genres
    resources :categories
    resources :details, only: [:index]
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
