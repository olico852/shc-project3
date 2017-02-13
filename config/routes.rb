Rails.application.routes.draw do
  

  resources :reviews
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :caregivers
  resources :fammembers

  root 'home#index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
