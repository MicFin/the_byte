TheByte::Application.routes.draw do

  root to: "members#index"

  post '/search/add' => 'recipes#create_from_search', as: :add_from_search

  post '/cookbook/remove' => 'recipes#remove_from_cookbook', as: :remove_from_cookbook


  devise_for :users
  resources :members
  resources :searches
  resources :cookbooks
  resources :recipes

end
