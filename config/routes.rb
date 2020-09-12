Rails.application.routes.draw do

  root to: 'homes#top'

  get 'kanri' => "homes#kanri"

  get 'kanri/new' => "homes#new"

  resources :news, only: [:create, :edit, :update, :destroy]
  resources :partners, only: [:create, :edit, :update, :destroy]

end
