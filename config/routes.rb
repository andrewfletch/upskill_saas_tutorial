Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'homebrew', to: 'pages#homebrew'
  get 'services', to: 'pages#services'
  get 'strain_collection', to: 'pages#strain_collection'
  get 'press', to: 'pages#press'
  resources :contacts, only: :create
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
  resources :store
end
