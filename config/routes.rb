Rails.application.routes.draw do
  devise_for :friend, controllers: {
    sessions: 'friends/sessions',
    registrations: 'friends/registrations'
  }

  get 'charges/new'

  get 'charges/create'

  get 'home/index'

  resources :friend_jobs
  resources :favorites, only: [:show, :create, :destroy]
  resources :dashboard #only: [:index]
  get '/dashboard/:id/prof_show' => 'dashboard#prof_show', as: :prof_show
  get '/dashboard/:id/prof_show_hospital' => 'dashboard#prof_show_hospital', as: :prof_show_hospital
  resources :jobs

  post "notifications/notify_text" => "notifications#notify_text"
  # get 'jobs/:id' => "jobs#show"
  get 'jobs/index' => 'jobs#index'
  resources :bookings

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end


  root "home#index"
  devise_for :hospitals, path: 'hospitals', controllers: { sessions: "hospitals/sessions", registrations: "hospitals/registrations" }

  devise_for :profs, path: 'profs', controllers: { sessions: "profs/sessions", registrations: "profs/registrations",  :omniauth_callbacks => "omniauth_callbacks"  }
   #omniauth_callbacks: "profs/omniauth_callbacks"
  devise_scope :prof do
    get 'auth/stripe_connect/callback' => 'yoopy_omniauth_callbacks#stripe_connect'
  end
  resources :profs, only: [:index]

  resources :charges, only: [:new, :create]
  resources :posts
  root to: 'posts#index'
  # get "omniauth_callbacks/:action/callback", :controller => "omniauth_callbacks", :constraints => { :action => /stripe_connect/ }


#
# , :omniauth_callbacks => "omniauth_callbacks"
end
