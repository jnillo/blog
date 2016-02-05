Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  namespace :administration do
    resources :posts
    resources :categories
  end
  root to: 'home#index'
  get ':slug', to: 'posts#show', as: 'show_post'
end
