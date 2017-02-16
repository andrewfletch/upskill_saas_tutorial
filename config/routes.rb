Rails.application.routes.draw do

  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being the default of "spree"
  #mount Spree::Core::Engine, at: 'pages#press'
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
