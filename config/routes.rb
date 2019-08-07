Rails.application.routes.draw do
  root to: 'pages#home'

  resources :warriors
  resources :fights, only: [:index, :show, :new, :create]

end
