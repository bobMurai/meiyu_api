Rails.application.routes.draw do

  put "/users", to: "users#update"

  put 'friend_relations', to: 'friend_relations#update'
  post 'friend_relations', to: 'friend_relations#create'

  get 'utils/sync', to: 'utils#sync'
  get 'utils/fr_sync', to: 'utils#fr_sync'

  # post 'users/register', to: 'users#register'
  mount_devise_token_auth_for 'User', at: 'auth'

end
