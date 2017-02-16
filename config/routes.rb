Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :fammembers do
    resources :patients, only: [:new, :create, :show, :edit, :delete]
    resources :reviews
  end


resources :reviews

  resources :caregivers do
    resources :transactions
    resources :reviews
  end


  resources :transactions
  resources :searches


  root 'home#index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
