Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  root 'welcome#index'
  resources :welcome
  resources :candidats

  namespace :customer do
    resources :customers
    resources :ads
    get 'tags/:tag', to: 'ads#index', as: :tag
  end


end
