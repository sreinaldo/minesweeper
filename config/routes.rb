Rails.application.routes.draw do
  resources :cells do
    post '/click' => 'cells#click'
  end

  resources :game_boards
  resources :users

  root to: 'games#index'
end
