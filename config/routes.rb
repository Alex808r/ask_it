Rails.application.routes.draw do
  #root 'hello#start' # или root to: 'hello#start', as: 'home'

  root 'pages#index'

  # get '/questions', to: 'questions#index' #resources :questions, only: :index
  # get '/questions/new', to: 'questions#new'
  # post '/questions', to: 'questions#create'
  # get 'questions/:id/edit', to: 'questions#edit'

  resources :questions, only: %i[index show new edit create update destroy]

end
