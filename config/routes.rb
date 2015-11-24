Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'
  resources :welcome
  resources :candidats

  namespace :customer do
    resources :customers
  end
end
