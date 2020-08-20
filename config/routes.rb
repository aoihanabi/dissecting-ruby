Rails.application.routes.draw do
  resources :portfolios
  #get 'pages/home'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  resources :blogs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #ROOT will declare what's the root of the application
  root to: 'pages#home'

end
