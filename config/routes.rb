Rails.application.routes.draw do


  root'pages#home'
  devise_for :users,
             controllers: { registrations: 'registrations'}

  resources :users, only: [:show]
  resources :services,except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'expertise_area'
      get 'location'
      get 'preload'
      get 'preview'
    end

    resources :photos, only: [:create, :destroy]
    resources :reservations, only: [:create]
  end

  resources :traveler_reviews, only: [:create, :detroy]
  resources :guide_reviews, only: [:create, :detroy]

  get '/your_bookings' => 'reservations#your_bookings'
  get '/your_reservations' => 'reservations#your_reservations'
  get 'search' => 'pages#search'

end
