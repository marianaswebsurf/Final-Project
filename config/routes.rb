Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htm
  resources :pages
  resources :bands
  resources :albums do
   member do 
   	 delete :delete_image_attachment
   	end
   end

   get '/more/', to: 'bands#more', as: 'more'

   get '/website/', to: 'pages#website', as: 'website'

   get '/music/', to: 'pages#music', as: 'music'

   get '/profile/', to: 'pages#profile', as: 'profile'

   get '/form/', to: 'pages#form', as: 'form'   

   get '/store/', to: 'pages#store', as: 'store'

   get '/popularband/', to: 'pages#popularband', as: 'popularband'

   get '/about/', to: 'pages#about', as: 'about'

   get '/albums/:id/add-more/', to: 'albums#add', as: 'add_more'

  root 'albums#index' 
end
