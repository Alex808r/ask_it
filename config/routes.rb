Rails.application.routes.draw do
  #root 'hello#start' # или root to: 'hello#start', as: 'home'

  root 'pages#index'

end
