Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :portfolios, except: [:show,:index]
  #get 'pages/home'
  #get 'pages/about'
  #get 'pages/contact'
  get 'portfolios/:subtitle', to: 'portfolios#index'
  get 'portfolios', to: 'portfolios#index'

  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  resources :blogs do
  	member do 
  		get :toggle_status
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
