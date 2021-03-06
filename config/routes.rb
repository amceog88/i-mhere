Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get "home/blog"
  get "home/about"
  get "home/contact"
  get "home/coming_soon"

  resources :writings
  namespace :admin do
    root 'home#index'
    resources :writings
  end

  mount Ckeditor::Engine => '/ckeditor'
  
end
