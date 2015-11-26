Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  root 'welcome#index'
  resources :welcome
  get 'tags/:tag', to: 'welcome#index', as: :tag
  resources :candidats
  resources :candidat_ads

  namespace :customer do
    resources :customers
    resources :ads
    get 'tags/:tag', to: 'ads#index', as: :tag
  end


end
