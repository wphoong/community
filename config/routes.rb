Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#index"
  resources :subcommunities do
    resources :posts, only: [:new, :create, :edit, :update, :show, :destroy] do
      resources :comments, only: [:create, :edit, :update, :destroy]
    end
  end
end
