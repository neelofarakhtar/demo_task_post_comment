Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  resources :users do
     collection  do
        get "/search", to: 'users#search'
      end
  end

  resources :posts do
    resources :likes
  end
  resources :posts do
    resources :comments
  end


 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
