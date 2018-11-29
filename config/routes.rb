Rails.application.routes.draw do
  

  #comment
  resources :comments, only: [:create, :destroy]
  
  #participates
  resources :participates, only: [:new, :create, :edit, :update, :destroy]
  
  get 'participates/new'

  get 'participates/edit'

  #jukebox
  get 'jukebox', to: 'jukebox#index'

  #song
  resources :songs
  post '/songs/:id/follow', to: 'follows#song_follow_toggle', as: 'song_follow'
  
  #artist
  resources :artists
  post '/artists/:id/follow', to: 'follows#artist_follow_toggle', as: 'artist_follow'
  
  #user
  devise_for :users
  
  #like
  post '/articles/:id/like', to: 'likes#like_toggle', as: 'like_article'

  #article
  root to: 'articles#index'
  resources :articles
  
  #profile
  get '/my_profile' => 'profiles#show'
  #get '/my_profile', to: 'profiles#show'와 같은 말
  get '/new_profile', to:'profiles#new'  
  get '/create_profile', to: 'profiles#new'
  post '/create_profile', to: 'profiles#create'
  get '/edit_profile', to: 'profiles#edit'
  get '/update_profile', to: 'profiles#edit'
  patch '/update_profile', to: 'profiles#update'
end
