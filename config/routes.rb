Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  resources :subcommunities do
    resources :subscriptions, only: %i[create destroy]
    resources :posts, only: %i[new create edit update show destroy] do
      resources :comments, only: %i[create edit update destroy]
    end
  end
end
