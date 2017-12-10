Blog::Engine.routes.draw do

  resources :posts

  get '/:id', to: 'blog#show', :as => 'blog'
  root to: 'blog#main'

end
