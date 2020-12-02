Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # get 'tests/members_only', to: 'tests#members_only'
  # resources :Users
  resources :chats
end
