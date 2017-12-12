Blog::Engine.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  resources :posts

  get '/:id', to: 'blog#show', :as => 'blog'
  root to: 'blog#main'

end
