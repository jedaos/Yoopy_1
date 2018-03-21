Rails.application.routes.draw do
  get 'home/index'

  resources :dashboard, only: [:index]
  resources :jobs

  # post '/dashboard' => 'jobs#new'
  # devise_for :profs
  # devise_for :hospitals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  devise_for :hospitals, path: 'hospitals', controllers: { sessions: "hospitals/sessions" }
  devise_for :profs, path: 'profs', controllers: { sessions: "profs/sessions", registrations: "profs/registrations" }
end
