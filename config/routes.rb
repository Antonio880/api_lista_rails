Rails.application.routes.draw do
  resources :usuarios
  post 'login', to: 'authentication#login'
end
