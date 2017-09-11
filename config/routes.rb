Rails.application.routes.draw do

  get 'welcome/index'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  root 'welcome#index'

  resources :articles do
    resources :comments
  end

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
