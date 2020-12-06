Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  post 'users/register', to: 'users#register'
  resources :chats
end
