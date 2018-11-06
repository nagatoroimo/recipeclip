Rails.application.routes.draw do

  get 'qa/index'

  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update] , param: :token
  resources :posts, only: [:show, :create, :new, :edit, :update, :destroy]
  resources :categories, only: [:index, :show]
  resources :notices, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :create, :edit, :update, :destroy]
  resources :blogs, only: [:new, :create, :edit, :destroy]

  root to: 'home#top'
  get '/', to: 'home#top'
  get 'about', to: 'home#about'
  get 'terms', to: 'home#terms'

  get 'results', to: 'results#index'
  get 'keyword/:search', to: 'results#keyword'

  get 'signup', to: 'users#new'
  get 'login', to: 'users#login_form'
  get 'users/:id/likes', to: 'users#likes'
  get 'users/:id/follows', to: 'users#follows'
  get 'users/:id/followers', to: 'users#followers'
  post 'users/:id/follows', to: 'users#follows'
  post 'login', to: 'users#login'
  post 'logout', to: 'users#logout'

  get "blog/:user_id/:id", to: "blogs#show"
  get "blog/:id/new", to: "blogs#new"
  get "blog/:user_id/:blog_id/in", to: "blogs#in"
  get "blog/:blog_id/article/:article_id/out", to: "articles#out"
  get "blog/:user_id/:blog_id/edit", to: "blogs#edit"
  post "blog/:user_id/:blog_id/update", to: "blogs#update"

  get "qa", to: "qa#index"
  get "qa/ameblo", to: "qa#ameblo"
  get "qa/fc2", to: "qa#fc2"
  get "qa/yahoo", to: "qa#yahoo"

  get "cooktime/edit", to: "cooktimes#edit"
  post "cooktime/update", to: "cooktimes#update"

  get "votes/ranking", to: "votes#ranking"

  get 'users/:user_id/temps', to: 'temps#index'
  get 'users/:user_id/temp/:id/edit', to: 'temps#edit'
  post 'temps/new', to: 'temps#new'
  post 'users/:user_id/temp/:id/update', to: 'temps#update'
  post 'users/:user_id/temp/:id/destroy', to: 'temps#destroy'
  post 'users/:user_id/temps/:id/read', to: 'temps#read'

  post 'contributions/:id/create', to: 'contributions#create'
  post 'contributions/:id/destroy', to: 'contributions#destroy'

  post 'likes/:post_id/create', to: 'likes#create'
  post 'likes/:post_id/destroy', to: 'likes#destroy'
  post 'likes/:id/read', to: 'likes#read'

  post 'follows/:user_id/create', to: 'follows#create'
  post 'follows/:user_id/destroy', to: 'follows#destroy'
  post 'follows/:id/read', to: 'follows#read'

  get 'password_resets/new', to: 'password_resets#new'
  get 'password_resets/edit'
  post 'password_resets/create', to: 'password_resets#create'

  get 'notifications/:id/:user_id/like_through', to: 'notification#like_through'
  get 'notifications/:id/temp_through', to: 'notification#temp_through'
  get 'notifications/:id/follow_through', to: 'notification#follow_through'

end
