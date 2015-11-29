Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  root 'welcome#index'
  resources :welcome
  get 'tags/:tag', to: 'welcome#index', as: :tag
  resources :candidats do
    collection do
      get 'list_conversation' => 'candidats#list_conversation', as: :list_conversation
      get 'show_conversation/:id' => 'candidats#show_conversation', as: :show_conversation
      post 'reply_conversation' => 'candidats#reply_conversation', as: :reply_conversation
    end
  end
  resources :candidat_ads

  namespace :customer do
    resources :customers
    resources :ads do
      collection do
        get 'list_conversation' => 'ads#list_conversation', as: :list_conversation
        get 'show_conversation/:id' => 'ads#show_conversation', as: :show_conversation
        post 'reply_conversation' => 'ads#reply_conversation', as: :reply_conversation
      end
    end

    resources :messages
    post 'messages/send_message' => 'messages#send_message', as: :send_message
    get 'ads/show_candidat/:candidat_id' => 'ads#show_candidat', as: :show_candidat
    get 'tags/:tag', to: 'ads#index', as: :tag
  end


end

# modifier routes [get, post]
