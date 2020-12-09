Rails.application.routes.draw do
  # resources :users do
  #   resources :chats
  #   resources :friend_relation_details
  # end

  # resources :friend_relations do
  #   resources :chats
  #   resources :friend_relation_details
  # end

  resources :users, only: [:update, :destroy]
  resources :friend_relations, only: [:create, :update]

  get 'utils/sync', to: 'utils#sync'
  get 'utils/fr_sync', to: 'utils#fr_sync'

  post 'users/register', to: 'users#register'
  mount_devise_token_auth_for 'User', at: 'auth'

end
