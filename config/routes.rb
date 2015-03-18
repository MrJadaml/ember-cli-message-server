Rails.application.routes.draw do

  resources :rants
  post 'login' => 'auth#authenticate'
end
