Rails.application.routes.draw do
  get 'charges/new'

  get 'charges/create'

  get 'home/index'

  resources :dashboard, only: [:index]
  resources :jobs
  get 'jobs/index' => 'jobs#index'
  resources :bookings
  post 'bookings/create' => 'bookings#create'
  # post '/dashboard' => 'jobs#new'
  # devise_for :profs
  # devise_for :hospitals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  devise_for :hospitals, path: 'hospitals', controllers: { sessions: "hospitals/sessions" }
  devise_for :profs, path: 'profs', controllers: { sessions: "profs/sessions", registrations: "profs/registrations", omniauth_callbacks: "profs/omniauth_callbacks" }

  resources :charges, only: [:new, :create]
  resources :posts
  root to: 'posts#index'

  get "auth/:action/callback", :controller => "omniauth_callbacks", :constraints => { :action => /stripe_connect/ }
  get 'auth/stripe_connect', as: 'stripe_connect_login'


#
# , :omniauth_callbacks => "omniauth_callbacks"
end
