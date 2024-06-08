Rails.application.routes.draw do
  resources :usuarios, only: [:create, :index, :show, :update, :destroy]
  post 'login', to: 'authentication#login'

  resources :tarefas, only: [:index, :show, :create, :update, :destroy]
end
