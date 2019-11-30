Rails.application.routes.draw do
  resources :cells
  resources :game_boards
  resources :users

  root to: 'games#index'
end
