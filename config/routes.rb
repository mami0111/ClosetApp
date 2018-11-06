Rails.application.routes.draw do
  resources :cloths
  devise_for :users
  root 'pages#index'
  get 'pages/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  get 'cloths/search' => 'cloths#search'
  
  
end
