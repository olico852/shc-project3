Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :caregivers
  resources :fammembers
<<<<<<< HEAD
  resources :patients
  resources :reviews
=======
  resources :transactions
  resources :searches
>>>>>>> 42df498ceb27927dd07d59b11c06a650c7117b2b

  root 'home#index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
