Rails.application.routes.draw do
  resources :cards

  resources :searches

  resources :synergies

  resources :expansions

  resources :piles

  resources :tag_relations

  resources :tags

  resources :decks

  resources :users

  resources :items, only: [:index, :show, :create, :update, :destroy]

  root 'static#index'
end
