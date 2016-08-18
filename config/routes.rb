Rails.application.routes.draw do
  resources :examples, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]

  resources :elements, only: [:index, :show, :create, :update, :destroy]
  resources :maps, only: [:index, :show, :create, :update, :destroy]

  # get '/users/:id/maps' => 'users#maps', :as => :user_maps
  resources :users do
    resources :maps
  end
end
