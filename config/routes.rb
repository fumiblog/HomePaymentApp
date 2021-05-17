Rails.application.routes.draw do
  namespace :users do
    get 'homes/top'
    resources :details
  end

  root 'users/homes#top'

  namespace :admins do
    resources :genres
    resources :categories
  end


  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
