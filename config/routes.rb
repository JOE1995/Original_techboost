Rails.application.routes.draw do

  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  get 'users/:id' => 'users#show'
  post 'logout' => 'users#logout'
  get '/' => 'home#top'

end
