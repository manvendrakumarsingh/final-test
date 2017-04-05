Rails.application.routes.draw do


 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 #get 'signUp'  => 'users#new'
#post'signUp'  => 'users#create' 
   post 'login' => 'sessions#create'
   post 'home' => 'users#home'
   post "profile",to: "users#show"
   post  'updateProfile'=>'users#update'
   resources :users
   resources :sessions
   resources :password_resets
end
