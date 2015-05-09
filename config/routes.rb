Rails.application.routes.draw do

  resources :rants, :users
  post 'login' => 'auth#authenticate'
  post 'signup' => 'users#create'
end
