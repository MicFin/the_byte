TheByte::Application.routes.draw do
  root to: "members#index"
  devise_for :users
  resources :members
  resources :searches
end
