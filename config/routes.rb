Rails.application.routes.draw do
  root 'lists#index'
  resources :lists, only: %w[index show new create] do
    resources :bookmarks
  end
  resources :bookmarks
end
