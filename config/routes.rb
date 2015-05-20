Rails.application.routes.draw do
  resources :cards, only: [:show]

  resources :searches

  resources :synergies

  resources :expansions

  resources :piles

  resources :tag_relations

  resources :tags

  resources :decks

  resources :users

  root 'static#index'
end
