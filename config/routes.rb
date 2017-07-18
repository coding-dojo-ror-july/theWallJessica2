Rails.application.routes.draw do
  root 'users#index'
  post 'users' => 'users#create'
  post 'users/authenticate' => 'users#authenticate'
  get 'users/logout' => 'users#logout'
  get 'messages/show' => 'messages#show'
  post 'messages' => 'messages#create'
  post 'messages/:id/comments' => 'comments#create'
end
