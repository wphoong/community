Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#index"
  resources :subcommunities do
    resources :posts, only: [:show, :new, :create, :update, :destroy]
  end
end
